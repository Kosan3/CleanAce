Rails.application.routes.draw do

  # デバイス
  devise_for :users, skip: :all
  devise_scope :user do
    # session
    get '/sign_in', to: 'users/sessions#new'
    post '/sign_in', to: 'users/sessions#create'
    # registration
    get '/sign_up', to: 'users/registrations#new'
    post '/sign_up', to: 'users/registrations#create'
    # password
    get '/password', to: 'users/passwords#new'
    post '/password', to: 'users/passwords#create'
  end

  # ユーザー
  resource :users, only: [:show, :edit, :update]
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end
end
