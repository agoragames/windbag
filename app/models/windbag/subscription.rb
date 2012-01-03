module Windbag
  class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :channel, :class_name => 'Windbag::Channel'
  end
end
