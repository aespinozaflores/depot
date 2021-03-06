require './app/store'
Rails.application.routes.draw do
  get 'form/input'
  match 'catalog' => StoreApp.new, via: :all
  get 'admin' => 'admin#index', as: 'admin_index', via: :all
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users  
  resources :products do
    get :download, on: :member  
    get :who_bought, on: :member
  end

  scope '(:locale)' do
    resources :orders
    resources :carts
    resources :line_items
    root 'store#index', as: 'store_index', via: :all
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# http://guides.rubyonrails.org/routing.html
end
