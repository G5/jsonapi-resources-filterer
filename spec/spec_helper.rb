$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'jsonapi/resources/filterer'
SPEC_DIR = File.dirname(__FILE__)
Dir[File.join(SPEC_DIR, "support", "**", "*.rb")].each {|f| require f}
Dir[File.join(SPEC_DIR, "fixtures/**/*.rb")].each {|f| require f}
