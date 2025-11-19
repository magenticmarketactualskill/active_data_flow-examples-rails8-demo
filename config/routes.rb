Rails.application.routes.draw do
  # Mount ActiveDataflow Rails engine
  # TODO: Uncomment when ActiveDataflow gems are fully implemented
  # mount ActiveDataFlow::RailsHeartbeatApp::Engine => "/active_data_flow"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Application routes
  root "home#index"
  resources :products
  resources :product_exports, only: [:index]
  
  # DataFlow routes
  get "data_flow", to: "data_flows#show", as: :data_flow
  post "heartbeat", to: "data_flows#heartbeat", as: :heartbeat
  get "heartbeat", to: "data_flows#heartbeat"
end
