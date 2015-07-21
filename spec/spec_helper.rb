$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# TODO Fix dependencies
require 'rails/all'
require 'jsonapi/resources/filterer'
require 'jsonapi/resources/matchers'
require 'pry'
require 'database_cleaner'

SPEC_DIR = File.dirname(__FILE__)
Dir[File.join(SPEC_DIR, "support", "**", "*.rb")].each {|f| require f}

# NOTE: load filterers first so they are available when resources are loaded
Dir[File.join(SPEC_DIR, "fixtures/filterers/*.rb")].each {|f| require f}
Dir[File.join(SPEC_DIR, "fixtures/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
