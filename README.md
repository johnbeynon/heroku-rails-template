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
* (Added 13 Aug 2013) Excludes .env from git via .gitignore
* (Added 13 Aug 2013) Adds .env_sample to communicate required ENV vars to other developers
* Removes standard database.yml replacing it with Postgres version
* Adds newrelic.yml (You will still need to add the addon to your application)
  [Read More](https://devcenter.heroku.com/articles/newrelic#copy-yml)
* Add rails_12_factor to Gemfile [Read More
* (Added 29 Aug 2013) Adds required rails_12_factor to Gemfile [Read More](https://devcenter.heroku.com/articles/rails4) following [this](https://devcenter.heroku.com/changelog-items/318) changelog entry to prevent deprecation notices in logs.

Rails 4

* (Added 05 Feb 2014) Adds sprockets_better_errors gem and enables it for development mode [Read
  More](https://github.com/schneems/sprockets_better_errors) - Only for Rails
  4.0.x.x

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

Notes
=====

If you get an error during deployment to Heroku along the lines of 

```
rake aborted! could not connect to server: Connection refused
Is the server running on host "127.0.0.1" and accepting
TCP/IP connections on port 5432?
```

Then you need to enable the User environment labs feature

```
heroku labs:enable user-env-compile -a myapp
```

I've found this can occur when you have certain Rails validations in your models
which require a DB hit during the application initialization which occurs when
assets are precompiled.

Read more about this feature
[here](https://devcenter.heroku.com/articles/labs-user-env-compile)

See Also
========

Sister project [heroku-new](https://github.com/johnbeynon/heroku-new) that adds
to the Heroku CLI

    heroku new:rails [APP_PATH]

rather than having to remember to type the template URL directly.
