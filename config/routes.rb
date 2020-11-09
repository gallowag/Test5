Rails.application.routes.draw do
  get 'about' => 'pages#about', as: 'about'
  get 'opportunities' => 'pages#opportunities', as: 'opportunities'
  
  root 'pages#index', as: 'home'

end
