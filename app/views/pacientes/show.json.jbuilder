json.id @paciente.id
json.nome_completo @paciente.nome_completo
json.data_nascimento @paciente.data_nascimento
json.cpf @paciente.cpf
json.email @paciente.email
json.telefone @paciente.telefone

# Detalhes do endereço
json.endereco do
  json.cep @paciente.endereco.cep
  json.cidade @paciente.endereco.cidade
  json.bairro @paciente.endereco.bairro
  json.logradouro @paciente.endereco.logradouro
  json.complemento @paciente.endereco.complemento
end
