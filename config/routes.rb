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
  end
  
  
  devise_for :admins, path: 'admin', skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :customers, only: [:index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end