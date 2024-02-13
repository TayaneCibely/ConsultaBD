class User < ApplicationRecord

  validates :role, inclusion: { in: %w[medico paciente]}
  has_one :paciente, dependent: :destroy
  has_one :medico, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def medico?
    user_type == 'medico'
  end

  def paciente?
    user_type == 'paciente'
  end
end
