require 'spec_helper'

module Snoop
  describe Subscription do
    it { should belong_to(:user) }
    it { should belong_to(:channel) }
  end
end
