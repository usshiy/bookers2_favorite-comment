Rails.application.routes.draw do
  root to:'home#top'
 resources :books, only: [:new, :create,:index, :show,:destroy,:edit,:update]
  devise_for :users
  
  get "home/about" => "home#about", as: "about"
  resources :users, only: [:show, :edit,:update,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
