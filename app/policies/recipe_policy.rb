# frozen_string_literal: true

class RecipePolicy < ApplicationPolicy
  def index?
    true
  end

  def edit?
    update?
  end

  def update?
    owned?
  end

  def destroy?
    owned?
  end

  def new?
    current_account.present?
  end

  def show?
    record.public? ||
      owned?
  end

  private
    def owned?
      record.account.id == current_account&.id
    end
end
