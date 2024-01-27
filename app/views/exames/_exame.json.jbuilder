json.extract! exame, :id, :cod, :data, :nomeExame, :descricao, :resultado, :created_at, :updated_at
json.url exame_url(exame, format: :json)
