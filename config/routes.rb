Rails.application.routes.draw do
  resources :programming_languages
  resources :listings
  devise_for :users

  post '/listings/:id/buy', to: 'listings#buy', as: 'buy'
  get "/listings/:id/success", to: "listings#success", as: "success"
  get "/listings/:id/cancel", to: "listings#cancel", as: "cancel"

  root 'home#page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
