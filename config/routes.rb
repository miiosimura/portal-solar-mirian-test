Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :home, only: %i[index]
  get '/simple_search', to: 'power_generators#simple_search'
  get '/advanced_search', to: 'power_generators#advanced_search'
  resources :power_generators, only: %i[show] do
    post '/delivery_tax', to: 'power_generators#delivery_tax'
  end
  get '/sort_search', to: 'power_generators#sort_search'
end