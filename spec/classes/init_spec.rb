require 'spec_helper'
describe 'ucsm_dockerDC' do
  context 'with default values for all parameters' do
    it { should contain_class('ucsm_dockerDC') }
  end
end
