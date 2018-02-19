Rails.application.routes.draw do

  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "omniauth_callbacks"
}

  root 'static_pages#index'
  get 'about', to: 'static_pages#about'
  get 'top', to: 'static_pages#top'

  resources 'users', only: [:index, :show] do
    get 'favorites', on: :member
    get 'followers', on: :member
    get 'followed', on: :member
  end

  resources 'posts' do
    resources 'likes', only: [ :create, :destroy ]
    resources 'comments', only: [ :create, :edit, :update, :destroy ]
  end

  get '/post/music', to: 'post_pages#music'
  get '/post/video', to: 'post_pages#video'
  get '/post/liric', to: 'post_pages#liric'

  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end

end
