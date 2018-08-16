class Api::V1::InvoiceInvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.where(invoice_id: params[:invoice_id])
  end

end
