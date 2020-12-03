Rails.application.routes.draw do

  get 'about' => 'pages#about', as: 'about'
  get 'opportunities' => 'pages#opportunities', as: 'opportunities'
  get 'success' => 'pages#success', as: 'success'

  root 'pages#index', as: 'home'

  get 'designers' => 'users#index', as: 'designers'
  get 'profile' => 'users#show'
  get 'signup' => 'users#new'
  get 'edit' => 'users#edit'
  get 'apply' => 'users#apply', as: 'apply'
  put 'apply' => 'users#update'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :sessions

  get 'gallery' => 'images#index', as: 'gallery'
  resources :images

end
