Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pizzas do
    resources :toppings, only: [:index, :new, :create]
  end
  resources :toppings do
    resources :pizzas, only: [:index, :new, :create]
  end
  resources :pizza_toppings
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'welcome#index'
end
