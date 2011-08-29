# Database.com Demo App

This app shows how to use the databasedotcom gem with omniauth to interact with data stored on Database.com as a heroku app with the Database.com instance provisioned as a heroku add-on.

## Install

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
