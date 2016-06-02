class Api::V1::Merchants::InvoicesController < Api::ApiController

  def index
    respond_with Invoice.where(merchant_id: params[:id])
  end
end
