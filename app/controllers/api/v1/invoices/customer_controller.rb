class Api::V1::Invoices::CustomerController < ApplicationController
  def show
    render json: Invoice.includes(:customer).find(params[:invoice_id]).customer
  end
end
