class Medico <  ApplicationRecord

  belongs_to :endereco
  accepts_nested_attributes_for :endereco
  has_many :consultas
  has_many :pacientes, through: :consultas

  validates :nome, presence: true, length: { minimum: 10 }, format: { with: /\A[^0-9]+\z/}
  validates :licenca, presence: true, uniqueness: true
  validates :especialidade, presence: true, length: { minimum: 5 }, numericality: false
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: true }
end
