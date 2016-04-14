Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
      namespace :v1 do
        resources :merchants, only: [:index, :show] do
          collection do
            get "/find", to: "merchants#find"
            get "/find_all", to: "merchants#find_all"
            get "/random", to: "merchants#random"
            get "/revenue", to: "merchants_analytics#all_revenue"
          end
          member do
            get "/items", to: "merchants#items"
            get "/invoices", to: "merchants#invoices"
            get "/favorite_customer", to: "merchants_analytics#favorite_customer"
            get "/customers_with_pending_invoices", to: "merchants_analytics#customers_with_pending_invoices"
            get "/revenue", to: "merchants_analytics#revenue"
          end
        end

        resources :items, only: [:index, :show] do
          collection do
            get "/find", to: "items#find"
            get "/find_all", to: "items#find_all"
          end
          member do
            get "/invoice_items", to: "items#invoice_items"
            get "/merchant", to: "items#merchant"
          end
        end

        resources :customers, only: [:index, :show] do
          collection do
            get "/find", to: "customers#find"
            get "/find_all", to: "customers#find_all"
          end
          member do
            get "/invoices", to: "customers#invoices"
            get "/transactions", to: "customers#transactions"
            get "/favorite_merchant", to: "customers_analytics#favorite_merchant"
          end
        end

        resources :invoices, only: [:index, :show] do
          collection do
            get "/find", to: "invoices#find"
            get "/find_all", to: "invoices#find_all"
          end
          member do
            get "/transactions", to: "invoices#transactions"
            get "/invoice_items", to: "invoices#invoice_items"
            get "/items", to: "invoices#items"
            get "/customer", to: "invoices#customer"
            get "/merchant", to: "invoices#merchant"
          end
        end

        resources :invoice_items, only: [:index, :show] do
          collection do
            get "/find", to: "invoice_items#find"
            get "/find_all", to: "invoice_items#find_all"
          end
          member do
            get "/invoice", to: "invoice_items#invoice"
            get "/item", to: "invoice_items#item"
          end
        end

        resources :transactions, only: [:index, :show] do
          collection do
            get "/find", to: "transactions#find"
            get "/find_all", to: "transactions#find_all"
          end
          member do
            get "/invoice", to: "transactions#invoice"
          end
        end
      end
    end
end
