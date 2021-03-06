module Api
  module V1
    class ItemsController < ApiController
      respond_to :json

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find(params[:id])
      end

      def find
        respond_with Item.find_by(item_params)
      end

      def find_all
        respond_with Item.where(item_params)
      end

      def invoice_items
        item = Item.find(params[:id])
        respond_with item.invoice_items
      end

      def merchant
        item = Item.find(params[:id])
        respond_with item.merchant
      end

      private

      def item_params
        params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
      end
    end
  end
end
