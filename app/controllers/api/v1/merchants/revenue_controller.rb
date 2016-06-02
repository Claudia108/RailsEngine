class Api::V1::Merchants::RevenueController < Api::ApiController

  def show
    if params[:date]
      revenue = Merchant.find(params[:id]).revenue_by_date(params[:date])
    else
      revenue = Merchant.find(params[:id]).total_revenue
    end
    respond_with({ revenue: revenue.to_s })
  end
end
