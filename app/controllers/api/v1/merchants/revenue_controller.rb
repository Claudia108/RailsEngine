class Api::V1::Merchants::RevenueController < Api::ApiController

  def show
    if params[:date]
      revenue = Merchant.find(params[:id]).revenue_by_date(params[:date])
    else
      revenue = Merchant.find(params[:id]).total_revenue
    end
    respond_with({ revenue: revenue.to_s })
  end

  def index
    respond_with Merchant.ordered_by_revenue(params[:quantity])
  end

  def revenue_by_date
    revenue = Merchant.revenue_all_merchants_by_date(params[:date])
    respond_with({ total_revenue: revenue.to_s })
  end
end
