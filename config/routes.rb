Rails.application.routes.draw do

  root 'home#index'

  resources :prescricoes
  resources :exames
  resources :prontuarios

  resources :pacientes do
    resources :exames, path: 'exames_do_paciente', as: 'exames_do_paciente'
    resources :prontuarios, path: 'prontuario_do_paciente', as: 'prontuario_do_paciente'
    resources :prescricoes, path: 'prescricoes_do_paciente', as: 'prescricoes_do_paciente'
  end

  get '/consultas/search', to: 'consultas#search', as: 'search_consultas'
  get '/medicos/search', to: 'medicos#search', as: 'search_medicos'
  get '/pacientes/search', to: 'pacientes#search', as: 'search_pacientes'

  resources :consultas
  resources :pacientes
  resources :medicos
end
