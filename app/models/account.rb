# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :user, inverse_of: :account, dependent: :destroy
  has_many :recipes, inverse_of: :account, dependent: :destroy

  validates :username, presence: true
end
