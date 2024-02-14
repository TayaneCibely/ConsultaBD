class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_type, inclusion: { in: %w(medico paciente), message: "%{value} não é um tipo válido"}

  # Métodos para verificar o tipo, se necessário
  def medico?
    user_type == 'medico'
  end

  def paciente?
    user_type == 'paciente'
  end
end
