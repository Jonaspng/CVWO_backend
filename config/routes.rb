Rails.application.routes.draw do
  root 'pages#home'
  get 'login', to:"pages#login"
end
