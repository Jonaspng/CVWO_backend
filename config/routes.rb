Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :list_items
  resources :categories
  get 'register/error', to: 'users#create_error'
  get 'register/success', to: 'users#create_success'
  get 'api/auth', to: 'sessions#persist'
  get 'api/login', to: 'sessions#validation'
  post 'api/login', to: 'sessions#create'
  post 'api/logout', to: 'sessions#destroy'
  get 'api/chart', to: 'sessions#chart'
  post 'api/filter', to: 'list_items#filter'
  post 'api/show_all', to: 'list_items#show_all'
end
