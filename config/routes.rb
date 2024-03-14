Rails.application.routes.draw do
  root 'pages#home'
  ActiveAdmin.routes(self)

  resources :recommendations
  resources :users
  resources :notifications
  resources :profiles
  resources :rooms do
    resources :messages
  end
  # root to: 'rooms#index'
  resources :samples do
    collection do
      get 'generate_pdf', format: :pdf
    end
  end
  resources :tamplates, only: [] do
    collection do
      get 'upload_csv'  
      post 'import_csv'  
    end
  end
  put '/samples', to: 'samples#update'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
