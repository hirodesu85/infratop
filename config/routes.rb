Rails.application.routes.draw do
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
