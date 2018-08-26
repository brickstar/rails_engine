class Api::V1::Items::MerchantController < ApplicationController

  def show
    render json: Item.includes(:merchant).find(params[:item_id]).merchant
  end

end
