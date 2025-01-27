Rails.application.routes.draw do
  resources :events
  resources :users do
    get :events, on: :member 
  end
  resources :categories do
    get :events, on: :member # This defines the category_events_path helper
  end

  root "events#index" 
end
