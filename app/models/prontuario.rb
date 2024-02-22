#noinspection RailsParamDefResolve
class Prontuario < ApplicationRecord
  belongs_to :paciente
  has_many :exames, dependent: :destroy
  has_many :prescricoes, class_name: "Prescricao", dependent: :destroy
  has_many :consultas, dependent: :destroy

  validates :codigo, presence: true, uniqueness: true
  validates :datacriacao, presence: true
  validates :historico, presence: true, length: { maximum: 500 }
end