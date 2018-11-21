Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  unauthenticated do
    root :to => 'application#homepage'
  end

  authenticated do
    root :to => 'posts#index'
  end

  get 'application/close'

  get '/profiles/:id/followers', to: 'profiles#followers', as: "followers"
  get '/profiles/:id/followees', to: 'profiles#followees', as: "followees"

  get 'profiles/show'
  get 'stalk_zones/show'
  post '/followings', to: 'followings#create', as: 'create_following'
  delete '/followings', to: 'followings#destroy', as: 'unfollow'
  devise_for :users do
  end
  resources :posts do
    resources :comments
  end
end
