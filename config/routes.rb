Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/officers', to: 'officers#index'
  get '/officers/:id', to: 'officers#show'
end
