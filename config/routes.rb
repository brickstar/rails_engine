Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'total_revenue#show'
      end

      scope module: 'merchants' do
        resources :merchants, only: [:index, :show]  do
          get '/items', to: 'items#index'
          get '/invoices', to: 'invoices#index'
          get '/revenue', to: 'revenue#show'
          get '/favorite_customer', to: 'favorite_customer#show'
        end
      end

      namespace :invoice_items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end

      resources :invoice_items, only: [:index, :show] do
        get '/item', to: 'invoice_items_item#show'
        get '/invoice', to: 'invoice_items_invoice#show'
      end

      namespace :invoices do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end

      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoice_transactions#index'
        get '/invoice_items', to: 'invoice_invoice_items#index'
        get '/items', to: 'invoices_items#index'
        get '/customer', to: 'invoice_customer#show'
        get '/merchant', to: 'invoice_merchant#show'
      end

      namespace :items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
      end

      resources :items, only: [:index, :show] do
        get '/merchant', to: 'item_merchant#show'
        get '/invoice_items', to: 'item_invoice_items#show'
      end

      namespace :transactions do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end

      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions_invoice#show'
      end

      namespace :customers do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end

      scope module: 'customers' do
        resources :customers, only: [:index, :show] do
          get '/invoices', to: 'invoices#index'
          get '/transactions', to: 'transactions#index'
          get '/favorite_merchant', to: 'favorite_merchant#show'
        end
      end
    end
  end
end
