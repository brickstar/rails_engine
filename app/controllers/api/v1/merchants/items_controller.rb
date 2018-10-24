class Api::V1::Merchants::ItemsController < ApplicationController

  def index
    render json: Item.where(merchant_id: params[:merchant_id])
  end

end
