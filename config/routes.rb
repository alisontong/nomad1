Rails.application.routes.draw do
  # Route to
  root 'sessions#index'

  get '/signup', to: 'users#new'

  get '/logout', to: 'sessions#destroy'

  get '/login', to: 'sessions#new'

  resources :sessions, only: [:create]

  resources :users, only: [:create, :show] 
  resources :posts
  

  resources :cities, only: [:show]

end


#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         sessions#index
#    signup GET    /signup(.:format)         users#new
#    logout GET    /logout(.:format)         sessions#destroy
#     login GET    /login(.:format)          sessions#new
#  sessions POST   /sessions(.:format)       sessions#create
#     users POST   /users(.:format)          users#create
#      user GET    /users/:id(.:format)      users#show
#     posts GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
#      city GET    /cities/:id(.:format)     cities#show





