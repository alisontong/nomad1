Rails.application.routes.draw do
  # Route to
  root 'cities#index'

  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

  resources :users, except: [:show, :new, :destroy, :index]
  get '/signup', to: 'users#new'
  get '/go/:username', to: 'users#show'
  
  resources :posts
  
  resources :cities, only: [:index]
  get "/:name", to: "cities#show"

end

#   Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         cities#index
#  sessions POST   /sessions(.:format)       sessions#create
#    logout GET    /logout(.:format)         sessions#destroy
#     login GET    /login(.:format)          sessions#new
#           POST   /users(.:format)          users#create
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#    signup GET    /signup(.:format)         users#new
#           GET    /go/:username(.:format)   users#show
#     posts GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
#    cities GET    /cities(.:format)         cities#index
#           GET    /:name(.:format)          cities#show




