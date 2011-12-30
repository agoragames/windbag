module Snoop
  class Channel < ActiveRecord::Base
    has_many :notifications, :class_name => 'Snoop::Notification'

    belongs_to :owner, :polymorphic => true, :foreign_key => :owner_id

    has_many :subscriptions, :class_name => 'Snoop::Subscription'
    has_many :subscribers, :through => :subscriptions, :source => :user

    validates_uniqueness_of :name
  end
end
