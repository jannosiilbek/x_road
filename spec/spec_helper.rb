require 'bundler/setup'
Bundler.setup

require 'x_road'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start

RSpec.configure do |config|
  # some (optional) config here
end
