Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
      namespace :v1 do
        resources :merchants, only: [:index, :show] do
          collection do
            get "/find", to: "merchants#find"
            get "/find_all", to: "merchants#find_all"
          end
        end

        resources :items, only: [:index, :show]
        resources :customers, only: [:index, :show]
        resources :invoices, only: [:index, :show]
        resources :invoice_items, only: [:index, :show]
        resources :transactions, only: [:index, :show]
      end
    end
end
