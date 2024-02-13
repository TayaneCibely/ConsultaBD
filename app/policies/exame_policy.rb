class ExamePolicy < ApplicationPolicy
  def show?
    user.medico? || (user.paciente? && record.user_id == user.id)
  end

  def update?
    user.medico?
  end

  def destroy?
    user.medico?
  end
end
