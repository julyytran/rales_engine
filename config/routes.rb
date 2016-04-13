Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
      namespace :v1 do
        resources :merchants, only: [:index, :show] do
          collection do
            get "/find", to: "merchants#find"
            get "/find_all", to: "merchants#find_all"
            get "/random", to: "merchants#random"
          end
          member do
            get "/items", to: "merchants#items"
            get "/invoices", to: "merchants#invoices"
          end
        end

        resources :items, only: [:index, :show] do
          collection do
            get "/find", to: "items#find"
            get "/find_all", to: "items#find_all"
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
          end
        end

        resources :invoices, only: [:index, :show] do
          collection do
            get "/find", to: "invoices#find"
            get "/find_all", to: "invoices#find_all"
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
            get "/invoices", to: "transactions#invoices"
          end
        end
      end
    end
end
