FactoryGirl.define do
  factory :notification, :class => Windbag::Notification do
    event :some_event
    title 'Some Event'
    description 'Some event has occurred... or maybe not. Without a well-tested notification system, how would you know?!'
    url 'http://example.com'
    icon 'some_icon'
    sticky false
    transports []

    trait :global_channel do
      channel { Windbag::Notification.global_channel }
    end

    factory :global_notification, :traits => [:global_channel]
  end

  factory :user do
    login 'Magda Schneider'
  end

  factory :channel, :class => Windbag::Channel do
    sequence(:name) { |n| "channel_#{n}" }
    trait(:owned_by_user){ association :owner, :factory => :user }
    factory :user_channel, :traits => [:owned_by_user]
  end
end
