module Api
  module V1
    class MerchantsAnalyticsController < ApiController
      respond_to :json

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
        respond_with merchant.revenue(params[:date])
      end

      def all_revenue
        respond_with Merchant.all_revenue(params[:date])
      end
    end
  end
end
