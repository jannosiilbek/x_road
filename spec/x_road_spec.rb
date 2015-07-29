require 'spec_helper'

describe XRoad do
  describe '#configure' do
    it 'has default values configured' do
      expect(XRoad.configuration.log_level).to equal(:info)
    end
  end
end
