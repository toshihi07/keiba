Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root 'top#index'
  resources :mypage, only: [:show,:edit,:update]
  resources :members, only: [:new, :create] 
  resources :bettings, only: [:new, :create] do
    collection do
      get 'category_children', defaults: {format:'json'}
    end
    member do
      get 'result'
    end
  end
  resources :articles, only: [:new,:create,:index,:show] do
    resources :comments, only: [:create]
  end
  resources :race_groups, only: [:index,:show,:new, :create, :edit, :update] do
    resources :posts, only: [:new,:create] do
  end
  post '/posts/race_groups/:race_group_id//posts/:post_id/likes' => 'likes#create', as: 'likes'
  delete '/posts/:post_id/likes' => 'likes#destroy', as: 'like'
  get 'books/index_simple' => 'books#index', as: 'books'
  get 'top/index'
  get '/logout', to: 'mypage#logout'
  get 'topics/show/:id',to: 'topics#show', as: :topics_show
  end
end
