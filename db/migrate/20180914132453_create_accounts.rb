# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :domain
      t.string :display_name
      t.string :note
      t.string :uri
      t.string :url
      t.datetime :last_webfingered_at
      t.string :inbox_url
      t.string :outbox_url
      t.string :shared_inbox_url
      t.string :followers_url

      t.timestamps

      t.index "lower((username)::text), lower((domain)::text)", name: "index_accounts_on_username_and_domain_lower", unique: true
    end
    remove_foreign_key "recipes", "users"
    remove_column :recipes, :user_id, :bigint
    add_column :recipes, :account_id, :bigint, null: false
    add_index :recipes, :account_id
    add_foreign_key "recipes", "accounts", index: true
    add_column :users, :account_id, :bigint, null: false
    add_index :users, :account_id
    add_foreign_key "users", "accounts", index: true
  end
end
