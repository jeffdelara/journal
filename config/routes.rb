Rails.application.routes.draw do
  root 'static_pages#index'
  
  devise_for :users
  
  get '/tasks', to: 'tasks#index'
  post '/accomplished_tasks/:id', to: 'accomplished_tasks#update'

  resources :categories, except: [:show, :index] do 
    resources :tasks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
