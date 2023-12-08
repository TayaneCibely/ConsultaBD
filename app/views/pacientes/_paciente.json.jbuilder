json.extract! paciente, :id, :nome_completo, :data_nascimento, :cpf, :email, :telefone
json.url paciente_url(paciente, format: :json)
