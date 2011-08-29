# Database.com Demo App

This app shows how to use the databasedotcom and omniauth gems to interact with data stored on Database.com from a heroku app using the Database.com addon.

## Install

    #from your app dire
    heroku addons:add database-com
    heroku config | grep DATABASE_COM_URL 
    cp keys.rv keys.rb.sample

  *use value from heroku as your ENV var*

    bundle install
    bundle exec foreman start

## Look, ma.  No ActiveRecord!
## (creating models)

To create models, login through the Database.com addon page from your heroku account.

- Create a custom object called "Product"
- call the name field "Name"
- give it a price field 
- give it a description field
- give it an image\_url field

Or just delete the PrdouctController and use your own models!

### Special features

We're using ::const\_missing to allow us to dynamically materialize the Database.com model objects.

## Logging in

OmniAuth is handling the login.
Credentials are stored in the session and a connection is established with Database.com each request.

OmniAuth has a bug that causes it to drop the "s" part of https, so we have to override it in the omniauth initializer.

### Change this in config/initializers/omniauth.rb

    if Rails.env.production? 
      OmniAuth.config.full_host = "https://www.example.com"
    end
