Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'posts#index', as: :root
  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts do
    resources :comments, only: [:create, :destroy, :show, :index]
  end












end
