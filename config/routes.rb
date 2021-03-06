Rails.application.routes.draw do

  # devise
  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "omniauth_callbacks"
}

  root to: 'static_pages#index'

  # static_pages
  get 'about', to: 'static_pages#about'
  get 'top', to: 'static_pages#top'
  get 'thanks', to: 'static_pages#thanks'

  # ユーザー
  resources :users, only: [:index, :show] do
    get 'favorites', on: :member
    get 'followers', on: :member
    get 'followed', on: :member
  end

  # 投稿
  resources :posts do
    resources 'likes', only: [ :create, :destroy ]
    resources 'comments', only: [ :create, :edit, :update, :destroy ]
  end

  # カテゴリーページ
  get '/post/music', to: 'post_pages#music'
  get '/post/video', to: 'post_pages#video'
  get '/post/lyric', to: 'post_pages#lyric'

  # フォロー
  resources :relationships, only: [ :create, :destroy ]

  # メッセージ
  resources :conversations, only: [ :index, :create ] do
    resources :messages, only: [ :index, :create ]
  end

  # お問い合わせ
  resources :contacts, only: [ :new, :create ] do
    collection do
      post :confirm
    end
  end

  # レターオペナー
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
