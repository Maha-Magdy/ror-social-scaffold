Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'posts#index'

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :friendships, only: [:create, :destroy, :update]

  get '/api/posts', to: 'api#show_posts'
  get '/api/posts/:post_id/comments', to: 'api#show_comments'
  post '/api/posts/comment', to: 'api#add_comment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
