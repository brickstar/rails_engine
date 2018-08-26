class Api::V1::Merchants::InvoicesController < ApplicationController

  def index
    render json: Invoice.where(merchant_id: params[:merchant_id])
  end

end
