Heroku Rails Template (WORK IN PROGRESS)
=====================

A Rails template for generating Heroku compatible Rails applications out of the box!

Usage
=====

To generate a new Rails 4 application

```
rails new myapp -m https://raw.github.com/johnbeynon/heroku-rails-template/master/rails4.rb
```

To generate a new Rails 3.2.x application

```
rails new myapp -m https://raw.github.com/johnbeynon/heroku-rails-template/master/rails32.rb
```

Assumptions
===========

* You have Ruby (2.0.0) installed via either RVM or RBENV
* Rails is already installed (confirm via $ rails -v )
* Postgres is installed locally

What this template does
=======================

* Replaces Gemfile will Heroku specific one (includes rails_12_factor)
* Switches sqlite to postgres
* Sets up Unicorn according to Heroku guidelines
* Adds Procfile
* Removes standard database.yml replacing it with Postgres version
