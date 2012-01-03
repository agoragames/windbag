require 'spec_helper'

module Windbag
  describe Channel do
    before(:all) do 
      DatabaseCleaner.clean_with :truncation
    end
    subject { Notification.global_channel }

    it { should validate_uniqueness_of :name }

    context 'global' do
      before { @users = create_list(:user, 2) }
      subject { Notification.global_channel }

      its(:class) { should eql Channel }
      its(:owner) { should be_nil }
      its(:name) { should eql 'global-notifications' }
      its(:subscribers) { subject.count.should eql User.count }
    end

    context 'user' do
      before do
        @users = create_list(:user, 2)
        User.count.should eql 2
      end

      let(:user) { @users.first }
      subject { user.windbag_channel }

      it { should_not be_nil }
      its(:name) { should eql "private-user-#{user.id}-notifications" }
      its(:owner) { should eql user }
      its(:owner_type) { should eql 'User' }
      its(:subscribers) { should_not be_nil }
      its(:subscribers) { should include(user) }

      it('only the user should be a subscriber') { subject.subscribers.size.should eql 1 }
    end

  end
end
