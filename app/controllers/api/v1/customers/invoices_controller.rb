class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    render json: Invoice.where(customer_id: params[:customer_id])
  end

end
