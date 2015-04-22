Rails.application.routes.draw do
resources :projects
resources :students

get '/search', to: 'projects#index'
post '/login', to: 'sessions#create'
get '/login', to: 'sessions#new'
delete '/logout', to: 'sessions#destroy' 

root 'home#show'
end
