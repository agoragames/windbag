# Windbag
### Notification System for Rails 3.1+

**Note: This extraction is incomplete!**

## Overview

Windbag is the event notification system extracted from [MLG Starcraft Arena](https://sc2.majorleaguegaming.com/).

Windbag consists of Channels, Subscriptions and Notifications. A user subscribes to the Global Channel, his
own Private Channel, and any number of channels belonging to your own models.

A Windbag notification is given a list of transport classes, which are triggered through an ActionMailer-like API
upon creation.

Transports are included for Pusher and ActionMailer, and notifications can be exposed as JSON data as well.

## Todo

* User-selected transport preferences for specific events.
