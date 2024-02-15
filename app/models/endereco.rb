class Endereco < ApplicationRecord
  has_many :medicos
  has_many :pacientes

  validates :cep, presence: true, length: { is: 8 }, numericality: { only_integer: true }
  validates :cidade, presence: true, length: { minimum: 3 }, format: { with: /\A[A-Za-z\s]+\z/, message: "deve conter apenas letras e espaços" }
  validates :bairro, presence: true, length: { minimum: 5 }, format: { with: /\A[A-Za-z\s]+\z/, message: "deve conter apenas letras e espaços" }
  validates :numero, presence: true, numericality: { only_integer: true }
  validates :logradouro, presence: true, length: { minimum: 8 }
  validates :complemento, presence: true, length: { minimum: 3 }
end