# frozen_string_literal: true

class InstructionGroupPolicy < ApplicationPolicy
  def update?
    false
  end

  def destroy?
    false
  end

  def new?
    false
  end

  def index?
    false
  end

  def show?
    false
  end
end
