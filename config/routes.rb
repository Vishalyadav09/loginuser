Rails.application.routes.draw do
  resources :users do
  resources :blogs
  end
  get 'home/index'
  
  root 'home#index'
resources :sessions, only: [:new, :create, :destroy]
get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'
#get 'blog', to: 'users#blog' , as: 'blog'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
