<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# ETA Notifications with Ruby on Rails and Twilio

[![Build Status](https://travis-ci.org/TwilioDevEd/eta-notifications-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/eta-notifications-rails)

Use SMS messages to keep customers up to date on the status of your mobile
workforce. Create a delightful on-demand experience with notifications triggered
by actions in a workflow or geolocation updates.

## Local development

This project is built using [Ruby on Rails](http://rubyonrails.org/) Framework.

1. First clone this repository and `cd` into it.

   ```bash
   git clone git@github.com:TwilioDevEd/eta-notifications-rails.git
   cd eta-notifications-rails
   ```

1. Install the dependencies.

   ```bash
   $ bundle install
   ```

1. Copy the `.env.example` file to `.env`, and edit it including your credentials
   for the Twilio API (found at https://www.twilio.com/console/account/settings).
   You will also need a [Twilio Number](https://www.twilio.com/console/phone-numbers/incoming).

   Run `source .env` to export the environment variables.

1. Update the seeds file with some valid phone numbers.

   Make sure you have updated the phone numbers at [`db/seeds.rb`](db/seeds.rb)
   with valid information.

1. Create the database and run migrations.

   Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on
   a Mac, I recommend [Postgres.app](http://postgresapp.com).

   ```bash
   $ bundle exec rake db:setup
   ```

1. Make sure the tests succeed.

   ```bash
   $ bundle exec rspec
   ```

1. Start the development server.

   ```bash
   $ bundle exec rails s
   ```

1. To update the notification status Twilio will use a publicly accessible
   endpoint that we need to expose. We recommend using
   [ngrok](https://www.twilio.com/blog/2013/10/test-your-webhooks-locally-with-ngrok.html)
   to solve this problem.

   ```bash
   ngrok http 3000
   ```

1. Check it out at `http://<ngrok-subdomain>.ngrok.io` in your browser.

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
