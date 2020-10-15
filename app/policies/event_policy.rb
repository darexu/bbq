class EventPolicy < ApplicationPolicy
  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    user.present?
  end

  def destroy?
    update?
  end

  def show?
    true
  end

  def update?
    user_is_owner?(record)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner?(link)
    user.present? && (link.try(:user) == user)
  end
end
