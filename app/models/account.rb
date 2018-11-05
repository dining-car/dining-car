# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :user, inverse_of: :account, dependent: :destroy
  has_many :recipes, inverse_of: :account, dependent: :destroy

  validates :username, presence: true

  scope :local, -> { where(domain: nil) }

  def to_param
    username
  end

  def self.find_local!(username)
    find_local(username) || raise(ActiveRecord::RecordNotFound)
  end

  def self.find_local(username)
    where(domain: nil).where("lower(username) = ?", username.to_s.downcase).take
  end
end
