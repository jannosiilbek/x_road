require 'spec_helper'

describe XRoad do
  describe '#configure' do
  
    XRoad.configure do |c|
      c.host = 'https://localhost'
      c.port = '1234'
      c.client_cert = '/dev/dummy.crt'
      c.client_key = '/dev/dummy.key'
      c.log_level = :info
      c.consumer = 1234
      c.log_level = :info
    end
  end

end
