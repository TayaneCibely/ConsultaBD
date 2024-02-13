class ProntuarioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.medico?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
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
