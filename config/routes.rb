Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'posts#index', as: :root
  # Defines the root path route ("/")
  # root "articles#index"

  # patch 'users/:id/change_password', to: 'users#change_password', as: :change_password_user

  # patch 'users/:id/change_password', to: 'users#change_password', as: :change_password_user

  resources :posts do
    resources :comments, only: [:create, :destroy, :show, :index]
  end

  resources :users, only: [:new, :create, :edit, :update] do
    resource :password, only: [:edit, :update]
  end

  resource :session, only:[:new, :create, :destroy]











end
