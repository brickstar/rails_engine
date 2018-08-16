class Api::V1::Merchants::TotalRevenueController < ApplicationController
  def show
    render json: Merchant.total_revenue_by_date(params[:date]), serializer: MerchantDateSerializer
  end
end
