Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: :index
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :comments, only: [:create, :destroy]

  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
