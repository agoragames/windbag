require 'spec_helper'

module Windbag
  describe Subscription do
    it { should belong_to(:user) }
    it { should belong_to(:channel) }
  end
end
