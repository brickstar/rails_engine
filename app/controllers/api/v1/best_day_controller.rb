class Api::V1::BestDayController < ApplicationController
  def show
    # binding.pry
    render json: Item.find(params[:item_id]).best_day, serializer: BestDaySerializer
  end
end
