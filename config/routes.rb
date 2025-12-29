Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "wines#index"

  resources :wines do
    resources :pictures_attachments, only: %i[destroy]
    collection do
      get :search
    end
  end
  resources :purchases
  resources :purchase_items, only: %i[index]
  resources :events
  resources :locations
  resources :discrepancies, only: %i[create]

  namespace :search_wines do
    get :search
  end
end
