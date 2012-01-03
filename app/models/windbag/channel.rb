module Windbag
  class Channel < ActiveRecord::Base
    has_many :notifications, :class_name => 'Windbag::Notification'

    belongs_to :owner, :polymorphic => true, :foreign_key => :owner_id

    has_many :subscriptions, :class_name => 'Windbag::Subscription'
    has_many :subscribers, :through => :subscriptions, :source => :user

    validates_uniqueness_of :name
  end
end
