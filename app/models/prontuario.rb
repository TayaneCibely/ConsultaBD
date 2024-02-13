class Prontuario < ApplicationRecord
  belongs_to :paciente
  has_many :exames
  has_many :prescricoes

  validates :codigo, presence: true, uniqueness: true
  validates :dataCriacao, presence: true
  validates :historico, presence: true, length: { maximum: 500 }

end
