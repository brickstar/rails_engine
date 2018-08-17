class Api::V1::MerchantRevenueController < ApplicationController

  def show
    if params[:date]
      render json: Merchant.find(params[:merchant_id]).total_revenue_for_merchant_by_date(params[:date]), serializer: MerchantRevenueSerializer
    else
      render json: Merchant.find(params[:merchant_id]).total_revenue_for_merchant, serializer: MerchantRevenueSerializer
    end
  end

end
