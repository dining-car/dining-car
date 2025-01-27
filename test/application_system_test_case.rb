# frozen_string_literal: true

require_relative "test_helper"

Capybara.configure do |config|
  config.server = :falcon_http
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  headless = ENV.fetch("HEADLESS", true) != "false"

  options = {}

  driven_by(:selenium, using: :chrome, screen_size: [1400, 1400], options:) do |driver|
    driver.add_argument("--headless") if headless
    driver.add_argument("--no-sandbox")
    driver.add_argument("--disable-dev-shm-usage")
    driver.add_argument("--disable-gpu")
  end
end
