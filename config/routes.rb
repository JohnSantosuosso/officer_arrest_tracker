Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/officers', to: 'officers#index'
  get '/officers/new', to: 'officers#new'

  get '/officers/:id', to: 'officers#show'
  get '/officers/:id/edit', to: 'officers#edit'
 

  get '/officers/:id/arrests', to: 'officer_arrests#index'
  get '/officers/:id/arrests/new', to: 'officer_arrests#new'
  post '/officers/:id/arrests', to: 'officer_arrests#create'

  post '/officers/', to: 'officers#create'


  patch '/officers/:id', to: 'officers#update'
  delete '/officers/:id', to: 'officers#destroy'

  get '/arrests', to: 'arrests#index'
  get '/arrests/:id', to: 'arrests#show'
  get '/arrests/:id/edit', to: 'arrests#edit'
  patch '/arrests/:id', to: 'arrests#update'

end
