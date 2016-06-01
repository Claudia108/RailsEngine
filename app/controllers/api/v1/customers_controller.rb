module Api
  module V1
    class CustomersController < ApiController
      respond_to :json, :xml

      def index
        respond_with Customer.all
      end

    end
  end
end