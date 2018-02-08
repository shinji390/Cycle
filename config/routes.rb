Rails.application.routes.draw do

  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "omniauth_callbacks"
}

  root 'posts#index'
  get 'top', to: 'static_pages#index'
  get 'about', to: 'static_pages#about'
  resources 'users', only: [:index, :show]

  resources 'posts' do
    resources 'likes', only: [ :create, :destroy ]
    resources 'comments', only: [ :create, :edit, :update, :destroy ]
  end

  resources :relationships, only: [:create, :destroy]
end
