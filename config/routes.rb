Rails.application.routes.draw do

  resources :users
  resources :trainings
  resources :sessions, only: [:new, :create, :destroy]

  root  'static_pages#home'

  match '/home',    to: 'static_pages#home',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match 'trainings(/:id)', to:'trainings#update', via:'POST' #モーダルからUpdateする為のRoute設定

end
