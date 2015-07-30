# XRoad

[![Build Status](https://travis-ci.org/jannosiilbek/x_road.svg)](https://travis-ci.org/jannosiilbek/x_road)
[![Code Climate](https://codeclimate.com/github/jannosiilbek/x_road/badges/gpa.svg)](https://codeclimate.com/github/jannosiilbek/x_road)
[![Test Coverage](https://codeclimate.com/github/jannosiilbek/x_road/badges/coverage.svg)](https://codeclimate.com/github/jannosiilbek/x_road/coverage)
[![Dependency Status](https://gemnasium.com/jannosiilbek/x_road.svg)](https://gemnasium.com/jannosiilbek/x_road)

This gem simplifies the usage of X-Road services. Feel free to add new service classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'x_road'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install x_road

## Usage

```ruby

require 'x_road'

XRoad.configure do |config|
  config.host = 'https://<security server ip>/cgi-bin/consumer_proxy'
  config.client_cert = '/path/server.crt'
  config.client_key = '/path/server.key'
  config.log_level = :info
  config.consumer = '12345678'
end

lms = XRoad::MyServiceName.find('1234567890')

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/x_road/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
