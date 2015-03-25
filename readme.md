# HOOKSTER: A Webhook sample app in Sinatra/Mongo
This application is a simple webhook exposed in Sinatra.  When a request hits the webhook (via a post),
it will return a status 204 (no content) and then process the data received.

## Why
We use Honeybadger for exception monitoring (as well as uptime monitoring), and it made sense for us
to make use of the newly exposed webhook feature in the uptime monitoring to take some action if our
site is down.  This application is simply a sample of what we did in our Sinatra API to accomplish it.

## Getting Started
Of course you will need to clone the repository

`````
git clone git@github.com:hollowmatt/hookster.git
`````

Once you have the repository, then run bundle install to get the gems you need, then start it up with:

`````
thin -R config.ru start -p 8080
`````

## Dependencies
 - Sinatra (of course)
 - Ruby 2.1.5
 - Mongo DB (I'm using the new 3.0.1)

 I use RVM to manage my ruby and gemsets, as such, there are .ruby-version and .ruby-gemset files in the
 repository.