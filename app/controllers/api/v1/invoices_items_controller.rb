class Api::V1::InvoicesItemsController < ApplicationController
  def index
    render json: Invoice.includes(:items).find(params[:invoice_id]).items    
  end
end
