Rails.application.routes.draw do
  resources :programming_languages
  devise_for :users
  resources :listings
  root 'home#page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
