# ETA Notifications for Ruby on Rails

ETA notifications implementation with Ruby on Rails and Twilio.

[![Build Status](https://travis-ci.org/TwilioDevEd/eta-notifications-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/eta-notifications-rails)

## Local development

This project is built using the [Ruby on Rails](http://rubyonrails.org/) web framework.

1. First clone this repository and `cd` into its directory:
   ```
   git clone git@github.com:TwilioDevEd/eta-notifications-rails.git
   cd eta-notifications-rails
   ```

1. Install the dependencies:
   ```
   bundle
   ```

1. Export the environment variables:
   You can find the `AccountSID` and the `AuthToken` at https://www.twilio.com/user/account/settings.
   ```
   export TWILIO_ACCOUNT_SID=Your Twilio Account SID
   export TWILIO_AUTH_TOKEN=Your Twilio Auth Token
   export TWILIO_PHONE_NUMBER=Your Twilio Phone Number
   ```

1. Update the seeds file with some valid phone numbers.

   Make sure you will update the phone numbers at `db/seeds.rb` with valid
   information.

1. Create database and run migrations:

   _Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on
   a Mac, I recommend [Postgres.app](http://postgresapp.com)_.

   ```
   rake db:setup
   ```

1. Make sure the tests succeed:
   ```
   rspec
   ```

1. Run the server:
   ```
   rails s
   ```

1. Check it out at [http://localhost:3000](http://localhost:3000)

1. To update the notification status Twilio will use a publicy accessible endpoint we exposed. We recommend using [ngrok](https://ngrok.com/) to solve this problem.

   ```
   ngrok http 3000
   ```

That's it!

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
