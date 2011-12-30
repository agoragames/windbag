require 'spec_helper'

module Snoop
  describe Channel do
#    before(:all) do 
#      DatabaseCleaner.clean_with :truncation
#    end
#    subject { Notification.global_channel }
#
#    it { should validate_uniqueness_of :name }
#
#    context 'global' do
#      before { @users = create_list(:user, 2) }
#      subject { Notification.global_channel }
#
#      its(:class) { should eql NotificationChannel }
#      its(:owner) { should be_nil }
#      its(:name) { should eql 'global-notifications' }
#      its(:subscribers) { subject.count.should eql User.count }
#    end
#
#    context 'user' do
#      before do
#        @users = create_list(:user, 2)
#        User.count.should eql 2
#      end
#
#      let(:user) { @users.first }
#      subject { user.notification_channel }
#
#      it { should_not be_nil }
#      its(:name) { should eql "private-user-#{user.id}-notifications" }
#      its(:owner) { should eql user }
#      its(:owner_type) { should eql 'User' }
#      its(:subscribers) { should_not be_nil }
#      its(:subscribers) { should include(user) }
#
#      it('only the user should be a subscriber') { subject.subscribers.size.should eql 1 }
#    end
#
#    context 'tournament' do
#      before { @tournament = create :tournament_registering }
#      let(:owner) { @tournament.owner }
#      subject { @tournament.notification_channel }
#
#      its(:name) { should eql "private-tournament-#{@tournament.id}-notifications" }
#      its(:owner_type) { should eql 'Tournament' }
#
#      it 'should be subscribed to by the owner' do
#        subject.subscribers.should include(owner)
#        owner.notification_channels.should include(subject)
#      end
#
#      describe 'when a player joins' do
#        before do
#          @player = create :user
#          FactoryGirl.create(:tournament_player, :user => @player, :tournament => @tournament)
#          @player.tournaments_as_player.should include(@tournament)
#        end
#
#        it 'should be subscribed to global notifications' do
#          @player.notification_channels.should include(Notification.global_channel)
#        end
#
#        it 'should be subscribed to private notifications' do
#          @player.notification_channels.should include(@player.notification_channel)
#        end
#
#        it 'should be subscribed to the tournament notifications' do
#          @player.notification_channels.should include(subject)
#        end
#
#        describe 'and then leaves' do
#          before { @player.leave_tournament(@tournament) }
#
#          it 'should not be subscribed to the tournament notification channel' do
#            @player.notification_channels.should_not include(subject)
#          end
#        end
#      end
#    end
  end
end
