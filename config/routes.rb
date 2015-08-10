Rails.application.routes.draw do
  # Route to
  root 'sessions#index'

  get '/signup', to: 'users#new'

  get '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'

  get '/login', to: 'sessions#new'

  resources :sessions, only: [:create]

  resources :users, only: [:create] do
    resources :posts
  end

  resources :cities, only: [:show]

end


#  Prefix Verb   URI Pattern                              Controller#Action
#    cities_show GET    /cities/show(.:format)                   cities#show
#      posts_new GET    /posts/new(.:format)                     posts#new
#     posts_show GET    /posts/show(.:format)                    posts#show
#         signup GET    /signup(.:format)                        users#new
#        profile GET    /profile(.:format)                       users#show
#          login GET    /login(.:format)                         sessions#create
#       sessions POST   /sessions(.:format)                      sessions#create
#     user_posts GET    /users/:user_id/posts(.:format)          posts#index
#                POST   /users/:user_id/posts(.:format)          posts#create
#  new_user_post GET    /users/:user_id/posts/new(.:format)      posts#new
# edit_user_post GET    /users/:user_id/posts/:id/edit(.:format) posts#edit
#      user_post GET    /users/:user_id/posts/:id(.:format)      posts#show
#                PATCH  /users/:user_id/posts/:id(.:format)      posts#update
#                PUT    /users/:user_id/posts/:id(.:format)      posts#update
#                DELETE /users/:user_id/posts/:id(.:format)      posts#destroy
#          users POST   /users(.:format)                         users#create
#           city GET    /cities/:id(.:format)                    cities#show
#           root GET    /                                        sessions#index





