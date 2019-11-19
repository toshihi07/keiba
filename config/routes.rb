Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root 'top#index'
  resources :mypage, only: [:show,:edit,:update]
  resources :members, only: [:new, :create] 
  resources :bettings, only: [:new, :create]
  resources :articles, only: [:new,:create,:index] 
  resources :race_groups, only: [:index,:show,:new, :create, :edit, :update] do
    resources :posts, only: [:new,:create]
  end
  get 'top/index'
  get '/logout', to: 'mypage#logout'

  get 'topics/show/:id',to: 'topics#show', as: :topics_show
end

