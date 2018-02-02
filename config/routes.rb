Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show, :create, :update, :destroy]
      resources :talks, only: [:create, :update, :destroy, :show]
      resources :comments, only: [:create, :destroy]
      resources :event_talks, only: [:show]
      resources :event_users, only: [:create, :index, :destroy]
      resources :talk_users, only: [:create, :index, :destroy]
      resources :users, only: [:create, :update, :destroy, :show]
      post 'user_token', to: 'user_token#create'
    end
  end
end
