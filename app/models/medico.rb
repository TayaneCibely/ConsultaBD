class Medico < ApplicationRecord
  has_many :consultas
  has_many :pacientes, through: :consultas

  validates :nome, presence: true, length: { minimum: 10 }, format: { with: /\A[^0-9]+\z/}
  validates :crm, presence: true, uniqueness: true, numericality: { only_integer: true, message: "Deve conter apenas dígitos númericos" }
  validates :uf_crm, presence: true, inclusion: { in: %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO], message: "UF inválida" }
  validates :especialidade, presence: true, length: { minimum: 5 }, numericality: false
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: true }

  private

  def horario_atendimento_valido
    if termino_consulta? && inicio_consulta? && inicio_consulta  >= termino_consulta
      errors.add(:base, "Início precisa ser antes do término do horário de atendimento")
    end
  end
end
