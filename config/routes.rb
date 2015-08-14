Rails.application.routes.draw do

  # Route to
  root 'cities#index'

  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

  resources :users, except: [:show, :new, :destroy, :index]
  get '/signup', to: 'users#new'
  get '/go/:username', to: 'users#show', as: 'profile'
  
  resources :posts do
    resources :comments, except: [:index]
  end
  
  resources :cities, only: [:index]
  get "/:name", to: "cities#show"

  resources :tag

  

end

#       Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            cities#index
#     sessions POST   /sessions(.:format)          sessions#create
#       logout GET    /logout(.:format)            sessions#destroy
#        login GET    /login(.:format)             sessions#new
#        users POST   /users(.:format)             users#create
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#       signup GET    /signup(.:format)            users#new
#      profile GET    /go/:username(.:format)      users#show
#        posts GET    /posts(.:format)             posts#index
#              POST   /posts(.:format)             posts#create
#     new_post GET    /posts/new(.:format)         posts#new
#    edit_post GET    /posts/:id/edit(.:format)    posts#edit
#         post GET    /posts/:id(.:format)         posts#show
#              PATCH  /posts/:id(.:format)         posts#update
#              PUT    /posts/:id(.:format)         posts#update
#              DELETE /posts/:id(.:format)         posts#destroy
#       cities GET    /cities(.:format)            cities#index
#              GET    /:name(.:format)             cities#show
#              POST   /comments(.:format)          comments#create
#  new_comment GET    /comments/new(.:format)      comments#new
# edit_comment GET    /comments/:id/edit(.:format) comments#edit
#      comment GET    /comments/:id(.:format)      comments#show
#              PATCH  /comments/:id(.:format)      comments#update
#              PUT    /comments/:id(.:format)      comments#update
#              DELETE /comments/:id(.:format)      comments#destroy




