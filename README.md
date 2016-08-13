# Capy Tracker API

Sample API implementation to use with [capy-tracker](https://www.npmjs.com/package/capy-tracker) package!

![](http://i.imgur.com/DiDrJyp.png)

The API was built over Rails 5.0.0.1. It also provides a clean GUI for consulting results.

## Build

You are expected to have Rails and Ruby 2.3 installed in your machine.

```
git clone https://github.com/haskellcamargo/capy-tracker-api.git
cd capy-tracker-api
gem install bundle
bundle install
bin/rails db:create
bin/rails db:migrate
```

## Run

```
bin/rails server
```

Please, note that our example is configured to run on port `3000` (the default one). Don't change it, now, ok?

## Features

- See the list of users who contacted you

![](http://i.imgur.com/4G5AiIX.png)

- Get the user profile picture from Gravatar

![](http://i.imgur.com/JcQMFkY.png)

- Monitor how long user stays in your page

![](http://i.imgur.com/LabAzp4.png)

Note: Use `.trackTime()` after `.start()` to observe.

Made with :heart: and energy drinks!
