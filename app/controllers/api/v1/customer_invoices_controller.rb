class Api::V1::CustomerInvoicesController < ApplicationController

  def index
    render json: Invoice.where(customer_id: params[:customer_id])
  end

end
