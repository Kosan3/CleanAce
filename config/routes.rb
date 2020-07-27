Rails.application.routes.draw do

  # デバイス
  devise_for :users, skip: :all
  devise_scope :user do
    # session
    get '/sign_in', to: 'users/sessions#new'
    post '/sign_in', to: 'users/sessions#create'
    delete '/sign_out', to: 'users/sessions#destroy'
    # registration
    get '/sign_up', to: 'users/registrations#new'
    post '/sign_up', to: 'users/registrations#create'
    # password
    get '/password', to: 'users/passwords#new'
    post '/password', to: 'users/passwords#create'
  end

  # ルートパス
  root 'products#top'

  # ユーザー
  resource :users, only: [:show, :edit, :update]
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  # 商品
  resources :products, only: [:index, :show] do
    get :top, on: :collection
    # 新カート
    resources :carts, only: [:create]
    # いいね
    resource :favorites, only: [:create, :destroy]
  end
  namespace :admin do
    resources :products, only: [:index, :create, :show, :edit, :update] do
      # 商品詳細
      resources :product_details, only: [:create, :edit, :update, :destroy]
    end
  end

  # カート
  resources :carts, only: [:index, :update, :destroy] do
    delete :destroy_all
  end

  # 注文
  resources :orders, only: [:index, :new, :create, :show] do
    post :confirmation, on: :new
    get :complete, on: :collection
  end
  namespace :admin do
    resources :orders, only: [:index, :show]
  end

  # 試合結果
  resources :results, only: [:index, :show]
  namespace :admin do
    resources :results, only: [:new, :create, :edit, :update, :destroy]
  end

  # メンバー
  resources :members, only: [:index, :show]
  namespace :admin do
    resources :members, only: [:new, :create, :edit, :update, :destroy]
  end

  # 募集
  resources :entries, only: [:new, :create]
  namespace :admin do
    resources :entries, only: [:index, :show]
  end

  # 写真
  namespace :admin do
    post '/image', to: 'product_images#create'
  end

  # アドミントップ
  namespace :admin do
    get 'admins/top', as: 'admin'
  end

  # 検索
  get '/search', to: 'search#search', as: 'search'

  # 会社
  get '/overview', to: 'company#overview', as: 'overview'

end
