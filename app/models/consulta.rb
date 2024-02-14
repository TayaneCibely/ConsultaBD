class Consulta < ApplicationRecord
  self.table_name = 'Consultas'
  belongs_to :paciente
  belongs_to :medico
  belongs_to :prontuario

  has_many :prescricoes
  has_many :exames

  validates :data, presence: true
  validates :horario, presence: true
  validates :descricao, presence: true

  validate :data_e_horario_valido
  validate :consulta_ocupada

  private

  def data_e_horario_valido
    return unless data.present? && horario.present?

    consulta_marcada = DateTime.new(data.year, data.month, data.day, horario.hour, horario.min)
    if consulta_marcada < Time.zone.now
      errors.add(:base, "Horário já passou")
    end
  end

  def consulta_ocupada
    return unless medico && data.present? && horario.present?

    if medico.consultas.exists?(data: data, horario: horario)
      errors.add(:base, "Horário já ocupado por outra consulta")
    end
  end
end
