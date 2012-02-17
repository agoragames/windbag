require 'spec_helper'

describe User do
  before :all do
    DatabaseCleaner.clean_with :truncation
  end
  subject { create :user }

  it { subject.should have_one :windbag_channel }
  it { subject.should have_many :windbag_subscriptions }
  it { subject.should have_many(:windbag_channels).through :windbag_subscriptions }

  describe 'subscriptions' do
    let(:channel) { create :channel }

    it 'can subscribe to a channel' do
      subject.subscribe channel
      channel.subscribers.should include(subject)
    end

    it 'can unsubscribe from a channel' do
      subject.subscribe(channel).unsubscribe(channel)
      channel.subscribers.should_not include(subject)
    end
  end

  describe 'global channel' do
    it 'should automatically subscribe' do
      Windbag::Notification.global_channel.subscribers.should include(subject)
    end
  end

  describe 'private channel' do
    it 'should be automatically created' do
      subject.windbag_channel.should be_instance_of Windbag::Channel
    end

    it 'should automatically subscribed' do
      subject.windbag_channel.subscribers.should include(subject)
    end
  end
end
