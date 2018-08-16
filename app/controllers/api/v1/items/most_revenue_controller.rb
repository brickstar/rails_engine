class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    render json: Item.unscoped.with_highest_revenue(params[:quantity])
  end
end
