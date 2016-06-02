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

      resources :items, only: [:index, :show] do
        get 'find', on: :collection
        get 'find_all', on: :collection
        get 'random', on: :collection
      end

      resources :invoices, only: [:index, :show] do
        get 'find', on: :collection
        get 'find_all', on: :collection
        get 'random', on: :collection
      end

      resources :invoice_items, only: [:index, :show] do
        get 'find', on: :collection
        get 'find_all', on: :collection
        get 'random', on: :collection
      end

      resources :transactions, only: [:index, :show] do
        get 'find', on: :collection
        get 'find_all', on: :collection
        get 'random', on: :collection
      end
    end
  end
end
