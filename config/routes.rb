Rails.application.routes.draw do


  get 'posts/:id' => 'posts#show'
  post 'posts/' => 'posts#create'
  post 'posts/:id/like' => 'posts#like'

  get 'users/:id' => 'users#show'
  post 'users/login' => 'users#login'
  get 'users/signup' => 'users#create'

end
