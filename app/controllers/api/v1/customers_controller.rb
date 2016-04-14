module Api
  module V1
    class CustomersController < ApiController
      respond_to :json

      def index
        respond_with Customer.all
      end

      def show
        respond_with Customer.find(params[:id])
      end

      def find
        respond_with Customer.find_by(customer_params)
      end

      def find_all
        respond_with Customer.where(customer_params)
      end

      def invoices
        customer = Customer.find(params[:id])
        respond_with customer.invoices
      end

      def transactions
        customer = Customer.find(params[:id])
        respond_with customer.transactions
      end

      def favorite_merchant
        customer = Customer.find(params[:id])
        fav_merch_id = customer.transactions.successful.group(:merchant_id).order(count: :desc).count.keys.first
        respond_with Merchant.find(fav_merch_id)
      end
      
      private

      def customer_params
        params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
      end
    end
  end
end
