require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.default_driver = :selenium #:poltergeist #:selenium
Capybara.app_host = 'http://www.google.com'
Capybara.default_max_wait_time = 15
Capybara.ignore_hidden_elements = false

RSpec.configure do |configuration|
  configuration.include Capybara::DSL
  configuration.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

# spec/support/wait_for_ajax.rb
module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script("angular.element(document.body).injector().get('$http').pendingRequests.length") == 0
  end
end

RSpec.configure do |config|
  config.include WaitForAjax, :type => :feature
end