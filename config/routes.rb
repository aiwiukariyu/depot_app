Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login'=> :new
    post 'login'=> :create
    delete 'logout'=> :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    
  end
  root 'store#index' , as: 'store_index', via: :all
  resources :products do
    get :who_bought, on: :member
  end
  resources :support_requests, only: [:index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
