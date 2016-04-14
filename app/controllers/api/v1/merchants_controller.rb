module Api
  module V1
    class MerchantsController < ApiController
      respond_to :json

      def index
        respond_with Merchant.all
      end

      def show
        respond_with Merchant.find(params[:id])
      end

      def find
        respond_with Merchant.find_by(merchant_params)
      end

      def find_all
        respond_with Merchant.where(merchant_params)
      end

      def random
        respond_with Merchant.order("RANDOM()").first
      end

      def items
        respond_with Item.where(merchant_id: params[:id])
      end

      def invoices
        respond_with Invoice.where(merchant_id: params[:id])
      end

      def favorite_customer
        merchant = Merchant.find(params[:id])
        fav_customer_id = merchant.invoices.joins(:transactions).where(transactions: {result: "success"}).group(:customer_id).order(count: :desc).count.keys.first
        respond_with Customer.find(fav_customer_id)
      end

      def customers_with_pending_invoices
        merchant = Merchant.find(params[:id])
        pending_cust_ids = merchant.invoices.pending.distinct.pluck(:customer_id)
        pending_customers = pending_cust_ids.map { |id| Customer.find(id) }
        respond_with pending_customers
      end

      def revenue
        merchant = Merchant.find(params[:id])
        respond_with merchant.revenue
      end

      private

      def merchant_params
        params.permit(:id, :name, :created_at, :updated_at)
      end
    end
  end
end
