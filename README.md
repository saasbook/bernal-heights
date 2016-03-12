# bernal-heights

[![Code Climate](https://codeclimate.com/github/candychang/bernal-heights/badges/gpa.svg)](https://codeclimate.com/github/candychang/bernal-heights)
[![Build Status](https://travis-ci.org/candychang/bernal-heights.svg?branch=master)](https://travis-ci.org/candychang/bernal-heights)

This is a web app for the Bernal Heights Neighborhood Center. To follow our progress, check out our [Pivotal Tracker] (https://www.pivotaltracker.com/n/projects/1543993).

## Testing Notes

### Cucumber

To avoid having to manually simulate login in cucumber each time, make sure to tag your features/scenarios with @noauth when needed.

## Development Notes

### Private data

We're using the [figaro] (https://github.com/laserlemon/figaro "Link to Figaro") gem to help manage our secrets.

Make sure all API keys and other secrets are stored in config/application.yml.
Push the **ENCRYPTED** version, config/application.yml.gpg whenever you make edits. Everyone else should be able to pull and decrypt to get application.yml.

Make sure the team knows what password was used to encrypt so we can decrypt.

In config/application.yml, you set variables like this:

    THE_SECRET: "some secret"
    
To reference it elsewhere in the app use 

    ENV["THE_SECRET"]
    
## Omniauth Notes
Troublesome enough to get its own section.

### Facebook
To manage FB login, make sure you're registered as a developer with Facebook and that you've got access to the [app for Bernal Heights] (https://developers.facebook.com/apps/1648142592105446/).
We'll also have to give our clients Testing roles at least in order for them to be able to log in, since we're in development mode.

#### Bernal Heights
Bernal Heights is the main app, the one we're using for production. The Website URL, App domain, and Valid OAuth Redirects are all set for production, so don't edit those.

#### bh_testing
bh_testing is a "test app" (look in the left column menu) for development and testing. Testing with cloud9 is irritating because we can't just use localhost:3000 as our development URL.

You will need to change 3 things in settings:
* App Domain
* Website URL
* Valid OAuth Redirect URL

For the App Domain and the Website URL, you want to use the cloud9 url that you get when you run

    $ rails s -p $PORT -b $IP
    
Under 'Advanced', the Valid OAuth Redirect URI should be

    [the cloud9 url]/users/auth/facebook/callback

We _could_ probably figure something out where we create a test app for each person's development url but that doesn't exist right now.

## Production

### Private data and other environment vars
If you've changed anything in config/application.yml then make sure to update heroku's environment variables:

    $ figaro heroku:set -e production

You can check a list of all the variables to make sure they got set correctly:

    $ heroku config -s

### Deploy

    $ git push heroku master
    $ heroku run rake db:migrate
    $ heroku run rake db:seed

...for now.



