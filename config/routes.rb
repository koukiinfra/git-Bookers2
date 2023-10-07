Rails.application.routes.draw do
  get 'home/about'=> 'homes#about', as: 'about'
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:index, :show, :create, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
