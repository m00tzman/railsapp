Rails.application.routes.draw do
resources :projects
resources :students

get '/search', to: 'projects#index'

root 'students#index'
end
