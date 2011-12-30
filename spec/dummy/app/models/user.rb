class User < ActiveRecord::Base
  has_one  :snoop_channel, :as => :owner, :dependent => :destroy, :class_name => 'Snoop::Channel'
  has_many :snoop_subscriptions, :class_name => 'Snoop::Subscription'
  has_many :snoop_channels, :through => :snoop_subscriptions

  after_save :subscribe_to_global_snoop_channel
  after_save :create_and_subscribe_to_own_snoop_channel

  def notifications
    notifications = []
    snoop_channels.each do |channel|
      notifications << channel.notifications
    end
    notifications.flatten!
  end

  # Subscribe to a NotificationChannel
  # Create a NotificationChannelSubscription between self and a given channel.
  # If a subscription already exists it will simply be returned.
  # @param [String|NotificationChannel] channel The channel to subscribe to (by name or NotificationChannel)
  # @return [NotificationChannelSubscription]
  def subscribe_to_snoop_channel(channel)
    unless channel.is_a?(Snoop::Channel)
      channel = Snoop::Channel.find_by_name(channel) || raise(ArgumentError, "Cannot subscribe to nonexistant channel: #{channel.inspect}")
    end
    Snoop::Subscription.find_or_create_by_user_id_and_channel_id(self.id, channel.id)
  end

  # Unsubscribe from a NotificationChannel
  # Destroy the NotificationChannelSubscription between self and a given channel.
  # @param [String|NotificationChannel] channel The channel to unsubscribe from (by name or NotificationChannel)
  def unsubscribe_from_snoop_channel(channel)
    unless channel.is_a?(Snoop::Channel)
      result = Snoop::Channel.find_by_name(channel)
      raise ArgumentError, "Cannot unsubscribe from nonexistant channel: #{channel}" if result.nil?
      channel = result
    end
    Snoop::Subscription.destroy_all(:user_id => self.id, :channel_id => channel.id)
  end

private

  def subscribe_to_global_snoop_channel
    subscribe_to_snoop_channel(Snoop::Notification.global_channel)
  end

  def create_and_subscribe_to_own_snoop_channel
    self.snoop_channel = Snoop::Channel.find_or_create_by_name(
      "private-user-#{self.id}-notifications")
    subscribe_to_snoop_channel(self.snoop_channel)
  end
end
