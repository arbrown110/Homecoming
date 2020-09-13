Rails.application.routes.draw do
  #root 'sessions#home'

  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  #logout route
  delete '/logout' => 'sessions#destroy'
 
  #OMNI/AUTH CALLBACK ROUTE

  get '/auth/google_oauth2/callback' => 'sessions#google'

  resources :users 
  resources :schools
  resources :playlists
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
