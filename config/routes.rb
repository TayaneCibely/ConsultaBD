Rails.application.routes.draw do
  root 'home#index'

  get '/consultas/search', to: 'consultas#search', as: 'search_consultas'
  get '/medicos/search', to: 'medicos#search', as: 'search_medicos'
  get '/pacientes/search', to: 'pacientes#search', as: 'search_pacientes'

  resources :consultas
  resources :pacientes
  resources :medicos
end
