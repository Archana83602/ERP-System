Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  post 'login', to: 'workhour#create'
  delete 'delete', to: 'workhour#destroy'
  get 'get' , to:'workhour#show'
  get 'show', to: 'workhour#index'
end
