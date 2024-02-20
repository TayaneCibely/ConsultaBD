Rails.application.routes.draw do
  resources :consulta
  resources :medico

  get 'auth_page/index'
  get 'home/index'

  devise_scope :paciente do
    authenticated :paciente do
      get "/pacientes/sign_out" => "devise/sessions#destroy"
      get "/minhas_consultas/:id" => "pacientes#minhas_consultas"
    end
  end

  devise_scope :medico do
    authenticated :medico do
      get "/medicos/sign_out" => 'devise/sessions#destroy'
    end
  end

  devise_for :pacientes
  devise_for :medicos

  resources :prescricoes
  resources :exames
  resources :prontuarios
  resources :pacientes

  root to: 'auth_page#index'
end
