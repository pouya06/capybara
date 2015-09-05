require 'capybara/rspec'
require_relative 'helper/spec_helper'

extend ::RSpec::Matchers

describe 'Login Page', :type => :feature do
  it 'should go to page' do
    sleep 25
   # expect(page).to have_content 'google'
  end
end
