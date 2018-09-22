# frozen_string_literal: true

json.extract! account, :id, :username, :domain, :display_name, :note, :uri, :url, :last_webfingered_at, :inbox_url, :outbox_url, :shared_inbox_url, :followers_url, :created_at, :updated_at
json.url account_url(account, format: :json)
