Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "omniauth_callbacks"
}

  root 'posts#index'
  resources 'users', only: [:index, :show]
  resources 'posts' do
    resources 'likes', only: [ :create, :destroy ]
  end
    
end
