class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    render json: Merchant.with_highest_revenue(params[:quantity])
  end
end
