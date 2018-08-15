class Api::V1::MerchantInvoicesController < ApplicationController

  def index
    render json: Invoice.where(merchant_id: params[:merchant_id])
  end

end
