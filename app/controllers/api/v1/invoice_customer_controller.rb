class Api::V1::InvoiceCustomerController < ApplicationController

  def show
    render json: Invoice.includes(:customer).find(params[:invoice_id])
  end

end
