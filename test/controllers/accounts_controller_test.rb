# frozen_string_literal: true

require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference("Account.count") do
      post accounts_url, params: { account: { display_name: @account.display_name, domain: @account.domain, followers_url: @account.followers_url, inbox_url: @account.inbox_url, last_webfingered_at: @account.last_webfingered_at, note: @account.note, outbox_url: @account.outbox_url, shared_inbox_url: @account.shared_inbox_url, uri: @account.uri, url: @account.url, username: @account.username } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { display_name: @account.display_name, domain: @account.domain, followers_url: @account.followers_url, inbox_url: @account.inbox_url, last_webfingered_at: @account.last_webfingered_at, note: @account.note, outbox_url: @account.outbox_url, shared_inbox_url: @account.shared_inbox_url, uri: @account.uri, url: @account.url, username: @account.username } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    assert_difference("Account.count", -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
