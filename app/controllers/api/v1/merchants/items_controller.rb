class Api::V1::Merchants::ItemsController < Api::ApiController

  def index
    respond_with Item.where(merchant_id: params[:id])
  end

  def most_items
    respond_with Merchant.ordered_by_sold_items(params[:quantity])
  end
end
