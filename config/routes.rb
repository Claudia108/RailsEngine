Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/customers/random', to: 'customers#random'
      get '/customers/find', to: 'customers#find'
      get '/customers/find_all', to: 'customers#find_all'
      resources :customers, only: [:index, :show]
      resources :merchants, only: [:index, :show] do
        get 'find', on: :collection
        get 'find_all', on: :collection
        get 'random', on: :collection
      end
      # get '/merchants/find', to: 'merchants#find'
      # get '/merchants/find_all', to: 'merchants#find_all'
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
end
