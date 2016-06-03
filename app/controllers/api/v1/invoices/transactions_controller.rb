class Api::V1::Invoices::TransactionsController < Api::ApiController

  def index
    respond_with Transaction.where(invoice_id: params[:id])
  end
end
