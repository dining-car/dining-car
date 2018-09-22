class RecipePolicy < ApplicationPolicy
  def update?
    owned?
  end

  def destroy?
    owned?
  end

  def new?
    user.present?
  end

  def show?
    record.public? ||
      user.present?
  end

  private
  def owned?
    record.user.id == user&.id
  end
end
