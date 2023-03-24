Rails.application.routes.draw do

  devise_for :customers, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root to: 'public/homes#top'


  scope module: :public do
    get '/mypage' => 'customers#show'
    get '/mypage/edit' => 'customers#edit'
    patch '/mypage' => 'customers#update'
    get '/mypage/confirm' => 'customers#confirm'
    patch 'mypage/destroy' => 'customers#destroy'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items' => 'cart_items#destroy_all', as: :destroy_all_cart_items
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:new, :create] do
      collection do
        post :confirm
        get :complete
      end
    end
  end


  devise_for :admins, path: 'admin', skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :customers, only: [:index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end