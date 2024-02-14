class Exame < ApplicationRecord

  belongs_to :consulta
  belongs_to :prontuario

  validates :cod, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :data, presence: true
  validates :nomeExame, presence: true
  validates :descricao, presence: true, length: { maximum: 300 }
  validates :resultado, presence: true, length: { maximum: 200 }

end
