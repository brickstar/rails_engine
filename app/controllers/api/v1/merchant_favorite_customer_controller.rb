class Api::V1::MerchantFavoriteCustomerController < ApplicationController

  def show
    render json: Merchant.find(params[:merchant_id]).favorite_customer
  end

end
