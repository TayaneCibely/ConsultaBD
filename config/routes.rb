Rails.application.routes.draw do

  root 'home#index'

  resources :pacientes do
    resources :prontuarios
    resources :prescricoes
  end

  resources :consultas do
    resources :exames
  end
  resources :medicos

  get 'consultas/search', to: 'consultas#search', as: 'search_consultas'
  get '/medicos/search', to: 'medicos#search', as: 'search_medicos'
  get '/pacientes/search', to: 'pacientes#search', as: 'search_pacientes'
  get 'search_prontuarios', to: 'prontuarios#search', as: 'search_prontuarios'
  get 'search_exames', to: 'exames#search'
  get 'search_prescricoes', to: 'prescricoes#search', as: 'search_prescricoes'

end
