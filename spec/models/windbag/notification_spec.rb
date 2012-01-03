require 'spec_helper'

module Windbag
  describe Notification do
    before(:all) do
      Notification.set_callback :create, :after, :deliver
    end

    after(:all) do
      Notification.skip_callback :create, :after, :deliver
    end

    it { should validate_presence_of(:event) }
    it { should validate_presence_of(:title) }

    class MockNotificationTransport
      class << self
        attr_reader :notification, :delivered, :subscriber_logins
        def with(notification_id)
          @delivered = false
          @notification = Notification.find(notification_id)
          @subscriber_logins = @notification.channel.subscribers.collect { |subscriber| subscriber.login }
          self
        end

        def deliver
          @delivered = true
        end
      end
    end

    context 'A global notification' do
      before { @users = create_list(:user, 2) }
      subject { create( :global_notification, :transports => [MockNotificationTransport] ) }
      its(:transports) { should include(MockNotificationTransport.to_s) }
      its(:channel) { should eql Notification.global_channel }
      its(:channel_name) { should eql Notification.global_channel.name }

      it 'should be delivered over transports after creation' do
        mock_transport = subject.transports.first.constantize
        mock_transport.notification.should eql subject
        mock_transport.delivered.should be_true
        mock_transport.subscriber_logins.should include(@users.first.login)
        mock_transport.subscriber_logins.should include(@users.last.login)
      end
    end
  end
end
