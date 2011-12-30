class User < ActiveRecord::Base
  has_one  :snoop_channel, :as => :owner, :dependent => :destroy
  has_many :snoop_subscriptions
  has_many :snoop_channels, :through => :snoop_subscriptions
end
