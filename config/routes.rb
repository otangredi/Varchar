Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :characters do
    resources :bookings, except: :index
  end
  get '/my-bookings', to: "bookings#my_bookings"
end
