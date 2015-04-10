Rails.application.routes.draw do
resources :students, only: [:index]
root 'home#show'
end
