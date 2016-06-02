module Api
  module V1
    class InvoiceItemsController < ApiController

      def index
        respond_with InvoiceItem.all
      end

      def show
        respond_with InvoiceItem.find(params[:id])
      end

      def find
        respond_with InvoiceItem.match(invoice_params)
      end

      def find_all
        respond_with InvoiceItem.find_all(invoice_params)
      end

      def random
        respond_with InvoiceItem.random_dataset
      end

      private

      def invoice_params
        params.permit(:id, :item_id, :invoice_id,
                      :quantity, :unit_price,
                      :created_at, :updated_at)
      end
    end
  end
end
