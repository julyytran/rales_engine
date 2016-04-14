module Api
  module V1
    class CustomersAnalyticsController < ApiController
      respond_to :json

      def favorite_merchant
        customer = Customer.find(params[:id])
        fav_merch_id = customer.transactions.successful.group(:merchant_id).order(count: :desc).count.keys.first
        respond_with Merchant.find(fav_merch_id)
      end
    end
  end
end
