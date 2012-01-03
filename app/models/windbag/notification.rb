module Snoop
  class Notification < ActiveRecord::Base

    belongs_to :channel, :class_name => 'Snoop::Channel'
    serialize :transports, Array

    validates_presence_of :event, :title

    before_validation :convert_transports

    after_create :deliver

    def self.global_channel
      Snoop::Channel.find_or_create_by_name('global-notifications')
    end

    def deliver
      self.transports.each do |transport|
        transport.constantize.with(self.id).deliver
      end
    end

    def convert_transports
      self.transports = self.transports.map {|t| t.to_s}
    end

    def channel_name
      self.channel.name if self.channel
    end

  end
end
