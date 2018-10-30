# frozen_string_literal: true

class SiteAdministrationPolicy < ApplicationPolicy
  def edit?
    admin?
  end

  def update?
    admin?
  end

  def create?
    admin?
  end

  def destroy?
    admin?
  end

  def new?
    admin?
  end

  def index?
    admin?
  end

  def show?
    admin?
  end
end
