module Snoop
  class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :channel, :class_name => 'Snoop::Channel'
  end
end
