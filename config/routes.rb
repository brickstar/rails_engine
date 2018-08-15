Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end

      resources :merchants, only: [:index, :show] do
        get  '/items', to: 'merchant_items#index'
        get  '/invoices', to: 'merchant_invoices#index'
      end

      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
