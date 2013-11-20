Giveprops::Application.routes.draw do

  resources :users, defaults: { format: :json } do
  	resources :props, defaults: { format: :json }
  end

	resources :professions, defaults: { format: :json } do
  	resources :props, defaults: { format: :json }
  end

  resources :countries, defaults: { format: :json }
  resources :cities, defaults: { format: :json }

  resources :countries, defaults: { format: :json } do
    resources :cities, defaults: { format: :json } do
    	resources :users, defaults: { format: :json } 
    end
  end

  resources :props, defaults: { format: :json }

  resources :site

  root 'site#index'

end
