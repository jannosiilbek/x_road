if RUBY_VERSION >= '1.9'
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'bundler/setup'
Bundler.setup
require 'x_road'

RSpec.configure do |config|
  # some (optional) config here
end
