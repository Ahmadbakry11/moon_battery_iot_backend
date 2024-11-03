# frozen_string_literal: true

class MoonBatteryPolicy < ApplicationPolicy
  def ping?
    record.id == battery.id
  end

  def update?
    record.id == battery.id
  end

  class Scope < ApplicationPolicy::Scope
  end
end
