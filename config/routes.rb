Rails.application.routes.draw do
  get 'characters/name'
  get 'characters/description'
  get 'characters/price:integer'
  get 'characters/category'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
