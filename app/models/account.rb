# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :user, inverse_of: :account
  has_many :recipes, inverse_of: :account

  validates :username, presence: true
end
