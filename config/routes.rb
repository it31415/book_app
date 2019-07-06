Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/circulate',  to: 'circulations#new'
  post '/circulate',  to: 'circulations#create'
  resources :circulations
end
