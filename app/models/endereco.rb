class Endereco < ApplicationRecord
  has_many :medicos
  has_many :pacientes

  validates :cep, presence: true, length: { is: 8 }, numericality: { only_integer: true }
  validates :cidade, presence: true, length: { minimum: 3 }
  validates :bairro, presence: true, length: { minimum: 5 }
  validates :numero, presence: true, numericality: { only_integer: true }
  validates :logradouro, presence: true, length: { minimum: 8 }
  validates :complemento, presence: true, length: { minimum: 3 }
end