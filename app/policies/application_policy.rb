# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :battery, :record

  def initialize(battery, record)
    @battery = battery
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(battery, scope)
      @battery = battery
      @scope = scope
    end

    def resolve
      raise NoMethodError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :battery, :scope
  end
end
