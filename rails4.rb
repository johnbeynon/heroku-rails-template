# Rails 4 Application Generator
# Resultant is 100% deployable to Heroku with no further changes


# Helper methods
def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

# Remove the Gemfile
remove_file 'Gemfile'

# Replace it with our Gemfile
copy_file 'files/rails4/Gemfile', 'Gemfile'

# Add Unicorn config
copy_file 'files/common/config/unicorn.rb', 'config/initializers/unicorn.rb'

# Add a Procfile
copy_file 'files/common/Procfile', 'Procfile'

