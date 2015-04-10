Rails.application.routes.draw do
resources :students, only: [:index, :show]
root 'home#show'
end
