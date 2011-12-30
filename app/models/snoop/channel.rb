module Snoop
  class Channel < ActiveRecord::Base
    has_many :notifications

    belongs_to :owner, :polymorphic => true, :foreign_key => :owner_id

    has_many :subscriptions
    has_many :subscribers, :through => :subscriptions, :source => :user

    validates_uniqueness_of :name
  end
end
