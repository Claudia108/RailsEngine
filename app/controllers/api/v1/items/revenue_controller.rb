class Api::V1::Items::RevenueController < Api::ApiController

  def index
    respond_with Item.highest_revenue_items(params[:quantity])
  end

  def most_items
    respond_with Item.most_sold_items(params[:quantity])
  end

  def best_day
    day = Item.find(params[:id]).highest_selling_day
    respond_with({ best_day: day })
  end
end
