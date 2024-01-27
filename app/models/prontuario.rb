class Prontuario < ApplicationRecord

  validates :codigo, presence: true, uniqueness: true
  validates :dataCriacao, presence: true
  validates :historico, presence: true, length: { maximum: 500 }

end
