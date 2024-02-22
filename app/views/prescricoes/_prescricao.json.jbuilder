json.extract! @prescricao, :id, :cod, :data, :dosagem, :observacoes, :listaMedicamentos, :created_at, :updated_at
json.url prescricao_url(@prescricao, format: :json)
