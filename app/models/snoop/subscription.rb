module Snoop
  class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :channel
  end
end
