class Prescricao < ApplicationRecord

  validates :cod, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :data, presence: true
  validates :observacoes, presence: true, length: { maximum: 500 }
  validates :dosagem, presence: true
  validates :listaMedicamentos, presence: true

end
