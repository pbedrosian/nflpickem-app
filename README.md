# README

This is an NFL Fantasy Pick-Em Team App.

## Getting started
To get the Rails server running locally:

-The first step in this getting this app working is needing an API key from MySportsFeeds. 
    -https://www.mysportsfeeds.com/
    -These keys are not free and do require a minimum $1 a month commitment to get access to the data. 
    -You will need to create a API key for the 2020 NFL reguslar season, seasson games. 
    -Once the key is aquired, you will need to add the key and password to a .env vile in the root directory of the app in order to have a local enviorment file.
        -The Gem you will use to acheive this is called Dotenv (links to Gem are below)
    -Once the key and password are created, add these to the .env file with the following format:
        -API_KEY=0000000-1111-4444-5555-121212:MYSPORTSFEEDS
        -This will pass the key and password into the URL when called. 
    
-Clone this repo
-bundle install to install all req'd dependencies
-rake db:migrate to make all database migrations
-rake db:seed to add all the teams, games, and weeks
-rails s to start the local server

## Dependencies

-Devise - For implementing authentication (https://github.com/heartcombo/devise)
-Omniauth - User sign-in/sign-up through Github(https://github.com/omniauth/omniauth)
-Dotenv Rails - For adding local enviorment file (https://github.com/bkeepers/dotenv)

## Folders

app/models - Contains the database models for the application where we can define methods, validations, queries, and relations to other models.
app/views - Contains templates for pages presented to user
app/controllers - Contains the controllers where requests are routed to their actions, where we find and manipulate our models and return them for the views to render.
config - Contains configuration files for our Rails application and for our database, along with an initializers folder for scripts that get run on boot.
db - Contains the migrations needed to create our database schema.