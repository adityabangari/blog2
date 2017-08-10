Rails.application.routes.draw do

  # get 'sessions#login'
  #
  # get 'sessions#home'
  #
  # get 'sessions#profile'
  #
  # get 'sessions#setting'
  #
  # get 'users#new'


resources :articles do

 resources :comments
end

post '/users', to: 'users#create'

 # get '/users/new', to: 'users#new'

get 'login', :to => 'sessions#login'
get 'signup', :to => 'users#new'
get 'login', :to => 'sessions#login'
post 'logout', :to => 'sessions#logout'
get 'home', :to => 'sessions#home'
get 'profile', :to => 'sessions#profile'
post 'login' , :to => 'sessions#login_attempt'


# match "setting", :to => "sessions#setting"



 # resources :users

# resources :sessions
 
 root 'welcome#home'

get 'welcomeshow', :to => 'welcome#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
