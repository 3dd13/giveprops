Giveprops::Application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations', registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_for :users
  # devise_for :users, :skip => [:sessions]

  as :user do
  	get '/register', to: 'devise/registrations#new', as: :register
  	get "/login" => 'devise/sessions#new'
    get "/login" => 'users/sessions#new'
    post '/login' => 'devise/sessions#create'
    get '/logout', to: 'devise/sessions#destroy', as: :logout
    get '/confirm' => 'devise/confirmations#show', as: :confirm
  end

 scope :api do
  resources :users, defaults: { format: :json } do
  	resources :props, defaults: { format: :json }
  end

	resources :professions, defaults: { format: :json } do
  	resources :props, defaults: { format: :json }
  end

  resources :countries, defaults: { format: :json }
  
  resources :cities, defaults: { format: :json } do
    resources :users, defaults: { format: :json } 
  end

  resources :countries, defaults: { format: :json } do
    resources :cities, defaults: { format: :json } do
    	resources :users, defaults: { format: :json } 
    end
  end

  resources :props, defaults: { format: :json }
end

  get '/search', to: 'search#index', as: :search
  resources :images, only: [:create]
  
  get '/:profile_name' => 'profile#show', as: :profile
  put '/:profile_name' => 'profile#update'
  
  resources :site
  resources :search

  root 'site#index'

end
