# BBQ

The application for organizing meetings with friends.

An example of work can be found here [https://shashlik.site](shashlik.site).

## Requirements

ruby '2.7.0'

rails '~> 6.0.3', '>= 6.0.3.1'

A complete list of gems used is specified in the Gemfile

## Features

* Event creation
* Event subscription
* Adding comments
* Adding photos
* Receiving email notifications
* Authorization using Oauth via VKontakte and Facebook

## Getting started

Download or clone repo

Use bundler (skip gems needed only in production)
```
bundle config set without 'production'
bundle install
```

Add environment variables fo omniauth

    OMNIAUTH_FACEBOOK_ID = 'your_facebook_id'
    OMNIAUTH_FACEBOOK_SECRET = 'your_facebook_secret'
    OMNIAUTH_VKONTAKTE_ID = 'your_vkontakte_id'
    OMNIAUTH_VKONTAKTE_SECRET = 'your_vkontakte_secret'

Add config for your application in [vkontakte](https://vk.com/dev) and [facebook](https://developers.facebook.com) 
development console for [omniauth](https://github.com/omniauth/omniauth) gem

Add environment variables for Amazon S3

    S3_ACCESS_KEY = 'your_accsess'
    S3_BUCKET_NAME = 'your_bucket_name'
    S3_BUCKET_REGION = 'bucket_region'
    S3_SECRET_KEY = 'your_secret_key'

Rename database.yml.example
```
mv config/database.yml.example config/database.yml
```

Run database migrations
```
bundle exec rails db:migrate
```

Install webpacker
```
bundle exec rails webpacker:install
```

Launch Rails server 
```
bundle exec rails s
```

Open `http://lvh.me:3000` in your browser
