# frozen_string_literal: true

require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  setup do
    @account = accounts(:one)
  end

  test "visiting the index" do
    visit accounts_url
    assert_selector "h1", text: "Accounts"
  end

  test "creating a Account" do
    visit accounts_url
    click_on "New Account"

    fill_in "Display Name", with: @account.display_name
    fill_in "Domain", with: @account.domain
    fill_in "Followers Url", with: @account.followers_url
    fill_in "Inbox Url", with: @account.inbox_url
    fill_in "Last Webfingered At", with: @account.last_webfingered_at
    fill_in "Note", with: @account.note
    fill_in "Outbox Url", with: @account.outbox_url
    fill_in "Shared Inbox Url", with: @account.shared_inbox_url
    fill_in "Uri", with: @account.uri
    fill_in "Url", with: @account.url
    fill_in "Username", with: @account.username
    click_on "Create Account"

    assert_text "Account was successfully created"
    click_on "Back"
  end

  test "updating a Account" do
    visit accounts_url
    click_on "Edit", match: :first

    fill_in "Display Name", with: @account.display_name
    fill_in "Domain", with: @account.domain
    fill_in "Followers Url", with: @account.followers_url
    fill_in "Inbox Url", with: @account.inbox_url
    fill_in "Last Webfingered At", with: @account.last_webfingered_at
    fill_in "Note", with: @account.note
    fill_in "Outbox Url", with: @account.outbox_url
    fill_in "Shared Inbox Url", with: @account.shared_inbox_url
    fill_in "Uri", with: @account.uri
    fill_in "Url", with: @account.url
    fill_in "Username", with: @account.username
    click_on "Update Account"

    assert_text "Account was successfully updated"
    click_on "Back"
  end

  test "destroying a Account" do
    visit accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Account was successfully destroyed"
  end
end
