require 'capybara/rspec'
require_relative 'helper/spec_helper'

extend ::RSpec::Matchers

describe 'Login to facebook', :type => :feature do
  it 'should be able to log in' do
    visit ('https://www.facebook.com')
    fill_in('email', :with => 'pouya_2002@yahoo.com')
    fill_in('pass', :with => 'karimi1984')
    click_button 'Log In'
    page.find('a[herf="https://www.facebook.com/babak.alipour.3""]').click
    sleep 25
    #expect(page).to have_content 'google'
  end
end
