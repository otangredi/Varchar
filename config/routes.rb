Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :characters do
    resources :bookings, except: [:index, :show, :destroy]
  end
  get '/bookings/:id', to: "bookings#show", as: :booking
  delete '/bookings/:id', to: "bookings#destroy", as: :delete_booking
  get '/my-bookings', to: "bookings#my_bookings"
  get '/my-characters', to: "characters#my_characters"
end
