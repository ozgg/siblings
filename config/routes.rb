# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  resources :posts
  resource :session

  scope :diary, controller: :diary do
    get '/' => :index, as: :diary
    get '/:date' => :show, as: :diary_entry, constraints: { date: /20\d\d-(0[1-9]|1[012])-(0[1-9]|[12]\d|3[01])/ }
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
