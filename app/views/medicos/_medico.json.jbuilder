json.extract! medico, :id, :nome, :crm, :uf_crm, :cpf, :especialidade, :email, :inicio_consulta, :termino_consulta, :created_at, :updated_at
json.url medico_url(medico, format: :json)