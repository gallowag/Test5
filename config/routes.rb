Rails.application.routes.draw do
  get 'about' => 'pages#about', as: 'about'
  get 'opportunities' => 'pages#opportunities', as: 'opportunities'

  root 'pages#index', as: 'home'

  get 'signup' => 'users#new'
  get 'profile' => 'users#show'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :sessions

end
