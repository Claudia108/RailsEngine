class Api::V1::Customers::InvoicesController < Api::ApiController

  def index
    respond_with Invoice.where(customer_id: params[:id])
  end
end
