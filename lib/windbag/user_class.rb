module Windbag
  module UserClass
    def self.included(base)
      base.class_eval do
        has_one  :windbag_channel, :as => :owner, :dependent => :destroy, :class_name => 'Windbag::Channel'
        has_many :windbag_subscriptions, :class_name => 'Windbag::Subscription'
        has_many :windbag_channels, :through => :windbag_subscriptions, :class_name => 'Windbag::Channel'

        after_create :subscribe_to_global_channel
        after_create :create_private_channel
      end
    end

  public
    def subscribe(channel)
      Subscription.find_or_create_by_user_id_and_channel_id(self.id, channel.id)
      self
    end

    def unsubscribe(channel)
      Subscription.destroy_all(:user_id => self.id, :channel_id => channel.id)
      self
    end

  protected
    def subscribe_to_global_channel
      subscribe Notification.global_channel
    end

    def create_private_channel
      self.windbag_channel = Channel.find_or_create_by_name(
        "private-user-#{self.id}-notifications"
      )
      subscribe self.windbag_channel
    end

  end
end
