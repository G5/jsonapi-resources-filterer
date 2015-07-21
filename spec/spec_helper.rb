$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# TODO Fix dependencies
require 'rails/all'
require 'jsonapi/resources/filterer'
require 'jsonapi/resources/matchers'
require 'pry'

SPEC_DIR = File.dirname(__FILE__)
Dir[File.join(SPEC_DIR, "support", "**", "*.rb")].each {|f| require f}

# NOTE: load filterers first so they are available when resources are loaded
Dir[File.join(SPEC_DIR, "fixtures/filterers/*.rb")].each {|f| require f}
Dir[File.join(SPEC_DIR, "fixtures/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.order = "random"
end
