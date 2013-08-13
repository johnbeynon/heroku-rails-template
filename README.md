Heroku Rails Template
=====================

A Rails template for generating a skeleton Rails application that will deploy to
Heroku with no changes and sets up the application following Heroku guidelines and best practices.

What this template does
=======================

Generates a new Rails application and then:

Common:

* Adds rack-timeout to Gemfile (defaults to 10 secs,  override via environment variable) [Read More](http://www.neilmiddleton.com/using-rack-timeout-with-heroku/)
* Switches sqlite to postgres [Read
  More](https://devcenter.heroku.com/articles/sqlite3)
* Sets up Unicorn according to Heroku guidelines (defaults to 3 processes with
  30 second timeout, override via environment variable)
  [Read More](https://devcenter.heroku.com/articles/rails-unicorn)
* Adds Procfile [Read More](https://devcenter.heroku.com/articles/procfile)
* Adds .env file for local environment variables [Read
  More](http://ddollar.github.io/foreman/#ENVIRONMENT)
* Excludes .env from git via .gitignore
* Adds .env_sample to communicate required ENV vars to other developers
* Removes standard database.yml replacing it with Postgres version
* Adds newrelic.yml (You will still need to add the addon to your application)
  [Read More](https://devcenter.heroku.com/articles/newrelic#copy-yml)
  
Rails 4

* Adds required rails_12_factor to Gemfile [Read More](https://devcenter.heroku.com/articles/rails4)

Rails 3

* Prevent application initializing assets on boot [Read
  More](https://devcenter.heroku.com/articles/rails-asset-pipeline)

Usage
=====

```
rails new myapp -m https://raw.github.com/johnbeynon/heroku-rails-template/master/generator.rb
```

Assumptions
===========

* You have Ruby (2.0.0) installed via either RVM or RBENV
* Rails is already installed (confirm via $ rails -v )
* Postgres is installed locally

