# config/initializers/timeout.rb
Rack::Timeout.timeout = Integer(ENV["RACK_TIMEOUT_SECONDS"] || 10)  # seconds