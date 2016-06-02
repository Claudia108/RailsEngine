class Api::V1::Merchants::ItemsController < Api::ApiController

  def index
    respond_with Item.where(merchant_id: params[:id])
  end

  # def most_items
  #   respond with Item.most_sold_items #(merchant_id: params[:id])
  # end
end
