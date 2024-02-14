Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticate :user do

    root 'home#index'
    get '/consultas/search', to: 'consultas#search', as: 'search_consultas'
    get '/medicos/search', to: 'medicos#search', as: 'search_medicos'
    get '/pacientes/search', to: 'pacientes#search', as: 'search_pacientes'
    resources :prescricoes
    resources :exames
    resources :prontuarios
    resources :consultas
    resources :pacientes
    resources :medicos
  end
end
