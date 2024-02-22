Rails.application.routes.draw do

  root 'home#index'

  resources :prescricoes
  resources :exames

  resources :pacientes do
    resources :exames, path: 'exames_do_paciente', as: 'exames_do_paciente'
    resources :prontuarios
    resources :prescricoes, path: 'prescricoes_do_paciente', as: 'prescricoes_do_paciente'
  end

  get '/consultas/search', to: 'consultas#search', as: 'search_consultas'
  get '/medicos/search', to: 'medicos#search', as: 'search_medicos'
  get '/pacientes/search', to: 'pacientes#search', as: 'search_pacientes'
  get '/search_prontuarios', to: 'prontuarios#search', as: 'search_prontuarios'

  resources :consultas
  resources :medicos
end
