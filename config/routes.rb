Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root 'top#index'
  resources :mypage, only: [:show,:edit]
  resources :members, only: [:new, :create] 
  resources :bettings, only: [:new, :create]
  resources :years, only: [:show] do
    resources :months, only: [:show] do
      resources :categories2, only: [:index] do
        resources :details2, only: [:index]
      end
    end
  end
  get 'top/index'
  get '/logout', to: 'mypage#logout'
  resources :management, only: [:new,:index,:create]

end

