# frozen_string_literal: true

require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should redirect to short account url" do
    get account_url(@account)
    assert_redirected_to short_account_url(@account)
  end
  test "should show account" do
    get short_account_url(@account)
    assert_response :success
  end
end
