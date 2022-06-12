require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestingP2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    MAX_FILES = 20
    MAX_COLUMNS = 6
    VALID_COLUMNS = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z][0..MAX_COLUMNS - 1]
    TOTAL_SEATS = MAX_FILES * MAX_COLUMNS

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
