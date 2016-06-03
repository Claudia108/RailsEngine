class Api::V1::Invoices::InvoiceItemsController < Api::ApiController

  def index
    respond_with InvoiceItem.where(invoice_id: params[:id])
  end
end
