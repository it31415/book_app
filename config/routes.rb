Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/circulate',  to: 'circulations#new'
  post '/circulate',  to: 'circulations#create'
  resources :circulations
  patch '/circulations/:id/return', to: 'circulations#return', as: 'return_circulation'
  get 'books/register', to: 'books#new', as: 'register_books'
  post 'books/register', to: 'books#create'
  resources :books
end
