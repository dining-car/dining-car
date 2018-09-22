# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :user, inverse_of: :account
  validates :username, presence: true
end
