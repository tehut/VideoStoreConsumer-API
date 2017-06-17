require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VideoStoreAPIRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #this loads everything in the lib folder automatically
    config.eager_load_paths << Rails.root.join('lib')

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*', 'localhost/8081'
        resource '*', :headers => :any, :methods => [:get, :post, :put, :delete, :options]
      end
# Allow CORS (cross origin resource sharing)
# Read More: https://demisx.github.io/rails-api/2014/02/18/configure-accept-headers-cors.html
      # config.Access-Control-Allow-Origin.action_dispatch.default_headers = {
  # Access-Control-Allow-Origin = 'http://my-web-service-consumer-site.com'
  # Access-Control-Request-Method = %w{GET POST OPTIONS}.join(",")

    end
  end
end
