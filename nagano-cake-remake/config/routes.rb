Rails.application.routes.draw do
  # Customer側のルーティング
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show', as: :my_page
    get 'customers/information/edit' => 'customers#edit', as: :edit_customer
    patch 'customers/information' => 'customers#update', as: :update_customer
    resource :customers, only: [] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :items, only: [:index, :show]
  end
  
  # Admin側のルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
