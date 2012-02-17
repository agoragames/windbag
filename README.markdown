# Windbag
### Notification Engine for Rails 3.1+

Windbag is an event notification system for Rails. Using Windbag with model observers, you can notify users about changes they're interested in over a variety of transports (WebSockets, email, SMS, Twitter, etc).

At present, the implementation of Transports is left up to you.

Windbag consists of Channels, Subscriptions and Notifications. A user subscribes to the Global Channel, his own Private Channel, and any number of other channels belonging to models in your application.

A Windbag notification is given a list of transport classes, which are triggered through an ActionMailer-like API upon creation.

## Installation

Add windbag to your Gemfile:

    gem 'windbag'

Then run `bundle install`, and migrate up:

    rake windbag:install:migrations
    rake db:migrate

In your **User** model, `include Windbag::UserClass`.

## Users and Channels

When a User is created, he is automatically subscribed to two channels; Windbag.global_channel, and a private one created just for him. To sub/unsub other channels:

    @user.subscribe(foo_channel).unsubscribe(bar_channel)

You can query `@user.notifications` for a list of notifications on all subscribed channels.

## Creating Notifications

    Windbag::Notification.create({
      :event => :rsvp
      :title => 'Someone has RSVP'd to the party!',
      :description => 'I will be there!'
      :url => party_url(party),
      :icon => 'party_hat.png',
      :sticky => false,
      :transports => [ Windbag::Transports::Mailer, Windbag::Transports::SMS, Windbag::Transports::Pusher ],
      :channel => party.windbag_channel
    })

When the notification is created, the **deliver** method will be called on each transport class provided.

### TODO

* User-selected transport preferences for specific events.
