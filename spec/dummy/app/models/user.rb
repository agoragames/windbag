class User < ActiveRecord::Base
  include Windbag::UserClass

  def notifications
    notifications = []
    windbag_channels.each do |channel|
      notifications << channel.notifications
    end
    notifications.flatten!
  end
end
