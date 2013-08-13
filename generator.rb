# ------------------------------------------------------------------------------
# 
# Heroku Rails Template Generator
#
# John Beynon
# http://github.com/johnbeynon/heroku-rails-template
#
# -----------------------------------------------------------------------------

# Helper methods
def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

def copy_from_repo(filename, destination)
  repo = 'https://raw.github.com/johnbeynon/heroku-rails-template/master/files/'
  get repo + filename, destination
end

def rails4?
  Rails::VERSION::MAJOR.to_s == "4"
end

say 'Heroku Rails Application Generator'

# Add Ruby 2.0 to Gemfile
gsub_file 'Gemfile', /source 'https:\/\/rubygems.org'/, "source 'https://rubygems.org'\nruby '2.0.0'"

# Add Rack timeout
gem 'rack-timeout'

# Switch from Sqlite3 to Postgres
gsub_file 'Gemfile', 'sqlite3', 'pg'

# Switch to Unicorn
gsub_file 'Gemfile', "# gem 'unicorn'", "gem 'unicorn'"

# Add Unicorn config
copy_from_repo 'common/config/unicorn.rb', 'config/unicorn.rb'

# Add Rack::Timeout config
copy_from_repo 'common/config/timeout.rb', 'config/initializers/timeout.rb'

# Add newrelic.yml
copy_from_repo 'common/config/newrelic.yml', 'config/newrelic.yml'

# Add a Procfile
copy_from_repo 'common/Procfile', 'Procfile'

# Add a .env file for local environment variables
copy_from_repo 'common/env', '.env'

# Add .env_sample for sample local variables 
copy_from_repo 'common/env_sample', '.env_sample'

# Ensure local .env file is added to .gitignore
run "echo '.env' >> .gitignore"

# Remove database.yml
remove_file 'config/database.yml'

# Replace with postgres friendly database.yml for local development
copy_from_repo 'common/config/database.yml', 'config/database.yml'

# Replace development database name with one extracted from application name
gsub_file "config/database.yml", /database: myapp_development/, "database: #{app_name.downcase}_development"

# Now do specific actions specfic to Rails version
case Rails::VERSION::MAJOR.to_s
when "3"
  # Rails 3
  environment 'config.assets.initialize_on_precompile = false'
when "4"
  # Rails 4
  gem_group :production do
    gem 'rails_12factor'
  end
end
