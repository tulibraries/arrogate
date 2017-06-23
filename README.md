# Arrogate: A Libguides Blacklight Application

## Getting started

Clone the github repository locally and change into the directory

```
git clone https://github.com/tulibraries/arrogate.git
cd arrogate
```

### Setup

Install the gem dependencies (generally we do this in an rvm gemset)

`bundle install`

Run the database migration
`bundle exec rails db:migrate`

Start solr_wrapper

`bundle exec solr_wrapper &`

Create a local user. Feel free to use your own email and password

`bundle exec rails runner " User.new(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password').save!"`

Start the rails server

`bundle exec rails s`


## Importing Data

To import data from your Libguides database, see the instructions for the [GuidingLight gem](https://github.com/tulibraries/guiding_light).

If you don't have a `config/libguides.yml` file, copy the example template

`cp config/libguides.yml.example config/libguides.yml`

and configure the parameters to match your Libguides installation.

Import the data

`bundle exec lg2solr harvest_all`

Ingest into Solr should take a few minutes at most.

## Periodic updates

Arrogate uses the [Whenever gem](https://github.com/javan/whenever) to generate a `crontab` entry.
Edit

`config/schedule.rb`

to customize the update frequency. Find detailed instructions in the Whenever gem documentation.
