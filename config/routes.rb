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

  # ユーザー側
  # ルートパス
  root 'products#top'
  # ユーザー
  resource :users, only: [:show, :edit, :update]
  # 商品
  resources :products, only: [:index, :show] do
    get :top, on: :collection
    # 新カート
    resources :carts, only: [:create]
    # いいね
    resource :favorites, only: [:create, :destroy]
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
  # 試合結果
  resources :results, only: [:index, :show]
  # メンバー
  resources :members, only: [:index, :show]
  # 募集
  resources :entries, only: [:new, :create]
  # 検索
  get '/search', to: 'search#search', as: 'search'
  # 会社
  get '/overview', to: 'company#overview', as: 'overview'
  # クリーンエースとは
  get '/team', to: 'team_introduction#top', as: 'team'

  # 管理者側
  namespace :admin do
    # アドミントップページ
    get 'admins/top', as: 'admin'
    # ユーザー
    resources :users, only: [:index, :show, :edit, :update]
    # 商品
    resources :products, only: [:index, :create, :show, :edit, :update, :destroy] do
      # 商品詳細
      resources :product_details, only: [:create, :edit, :update, :destroy]
    end
    # オーダー
    resources :orders, only: [:index, :show]
    # 試合結果
    resources :results, only: [:new, :create, :edit, :update, :destroy]
    # メンバー
    resources :members, only: [:new, :create, :edit, :update, :destroy]
    # 募集
    resources :entries, only: [:index, :show]
    # 写真
    post '/image', to: 'product_images#create'
  end

end
