# bernal-heights

[![Code Climate](https://codeclimate.com/github/candychang/bernal-heights/badges/gpa.svg)](https://codeclimate.com/github/candychang/bernal-heights)
[![Build Status](https://travis-ci.org/candychang/bernal-heights.svg?branch=master)](https://travis-ci.org/candychang/bernal-heights)

This is a web app for the Bernal Heights Neighborhood Center. To follow our progress, check out our [Pivotal Tracker] (https://www.pivotaltracker.com/n/projects/1543993).

## Testing Notes

### Cucumber

To avoid having to manually simulate login in cucumber each time, make sure to tag your features/scenarios with @noauth when needed.

@javascript tag before any scenarios that use javascript will run the Poltergeist driver instead of the RackTest. Use this tag for confirming modals, etc. Read more about the documentation in [Capybara] (https://github.com/jnicklas/capybara/blob/master/README.md#modals) and [Poltergeist] (https://github.com/teampoltergeist/poltergeist#installing-phantomjs).

To get PhantomJs working, you'll need it [installed] (https://github.com/teampoltergeist/poltergeist#installing-phantomjs) on your dev environment. Travis CI already has it pre-installed. You can follow those instructions; if it's not working out on Cloud9 try:

    sudo npm install -g phantomjs-prebuilt  


### Travis CI

Find the configuration for travis in .travis.yml.
Refer to [the documentation] (https://docs.travis-ci.com/user/customizing-the-build/) if you need to change it.

Currently it runs the full suite of rspec and cucumber tests, and there integrations with Code Climate and Slack.

## Development Notes

### Private data

In config/application.yml, you set variables like this:

    THE_SECRET: "some secret"
    
To reference it elsewhere in the app use 

    ENV["THE_SECRET"]

Make sure all API keys and other secrets are stored in config/application.yml. This file should never be pushed to git - only its encrypted version, config/application.yml.gpg should be.

We're using gpg to encrypt things. If you need help setting up gpg, [this guide] (https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages-on-an-ubuntu-12-04-vps) was pretty useful.

The file is asymmetrically encrypted, with a password, because Travis CI was being difficult about public/private key encryption. However, the password file itself is able to be encrypted with public/private. Make sure your public key is pushed to the public_keys folder.
As long as the person encrypting the password file encrypts it for your public key, you should be able to decrypt the password.txt.gpg file to get the password you'll use on config/application.yml.

To decrypt the password.txt.gpg file:

    $ gpg public_keys/password.txt.gpg

And give it the password you created during gpg secret key setup.

Note: If for some reason we need to change the password again, make sure Travis CI also gets updated, or else it won't be able to run any of the tests. Refer to [the documentation] (https://docs.travis-ci.com/user/encrypting-files/#Manual-Encryption) for more details.

#### If someone pushes updated config/application.yml.gpg

Make sure to update your local config/application.yml file!
To do this, run

    $ gpg config/application.yml.gpg
    
And give it the password in the password.txt.gpg file -- you should have the decrypted version if you followed the instructions above.

#### If you modify config/application.yml

Encrypt the file asymmetrically (overwriting the old config/application.yml.gpg) and push that in your commit:

    $ gpg -c config/application.yml.gpg

Give it the password you decrypted from public_keys/password.txt.gpg.
Everyone else should be able to pull and decrypt to get the updated environment variables.

## Production

### Private data and other environment vars
We're using the [figaro] (https://github.com/laserlemon/figaro "Link to Figaro") gem to help manage our environment variables on production.

If you've changed anything in config/application.yml then make sure to update heroku's environment variables:

    $ figaro heroku:set -e production

You can check a list of all the variables to make sure they got set correctly:

    $ heroku config -s

### Deploy

    $ git push heroku master
    $ heroku run rake db:migrate
    $ heroku run rake db:seed

Sometimes with javascript/bootstrap changes, you will want to recompile the assets. Try this if it works on the dev environment, but somehow it fails in production.

    $ heroku run rake assets:clean
    $ heroku run rake assets:precompile




