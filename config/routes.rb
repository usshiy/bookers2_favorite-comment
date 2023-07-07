Rails.application.routes.draw do
  root to:'home#top'
 resources :books, only: [:new, :create,:index, :show,:destroy,:edit,:update] do
 resources :book_comments, only: [:create,:destroy]
 resource :favorites, only: [:create, :destroy]
 end
  devise_for :users
  
  get "home/about" => "home#about", as: "about"
  resources :users, only: [:show, :edit,:update,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
