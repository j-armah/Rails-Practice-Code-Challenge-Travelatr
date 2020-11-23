Rails.application.routes.draw do
  
  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/new'

  # get 'posts/create'

  # get 'destinations/index'

  # get 'destinations/show'

  # get 'bloggers/show'

  # get 'bloggers/new'

  # get 'bloggers/create'

patch 'like/:id', to: 'posts#likes', as: 'likes'

resources :bloggers
resources :destinations
resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
