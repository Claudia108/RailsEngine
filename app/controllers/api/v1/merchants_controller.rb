module Api
  module V1
    class MerchantsController < ApiController

      def index
        respond_with Merchant.all
      end

      def find
        respond_with Merchant.match(merchant_params)
      end

      def find_all
        respond_with Merchant.find_all(merchant_params)
      end

      def random
        respond_with Merchant.random_dataset
      end

      def show
        respond_with Merchant.find(params[:id])
      end

      private

      def merchant_params
        params.permit(:id, :name, :created_at, :updated_at)
      end
    end
  end
end
