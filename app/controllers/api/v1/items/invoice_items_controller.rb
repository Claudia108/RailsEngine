class Api::V1::Items::InvoiceItemsController < Api::ApiController

  def index
    respond_with InvoiceItem.where(item_id: params[:id])
  end
end
