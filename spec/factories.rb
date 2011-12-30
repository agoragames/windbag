FactoryGirl.define do
  factory :notification, :class => Snoop::Notification do
    event :some_event
    title 'Some Event'
    description 'Some event has occurred... or maybe not. Without a well-tested notification system, how would you know?!'
    url 'http://example.com'
    icon 'some_icon'
    sticky false
    transports []

    trait :global_channel do
      channel { Snoop::Notification.global_channel }
    end

    factory :global_notification, :traits => [:global_channel]
  end

  factory :user do
    login 'Magda Schneider'
  end
end
