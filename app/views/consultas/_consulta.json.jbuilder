json.extract! consulta, :id, :nome, :data, :horario,:created_at, :update_at
json.url consulta_url(consulta, format: :json)