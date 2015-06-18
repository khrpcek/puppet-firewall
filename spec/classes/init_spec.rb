require 'spec_helper'
describe 'firewall' do

  context 'with defaults for all parameters' do
    it { should contain_class('firewall') }
  end
end
