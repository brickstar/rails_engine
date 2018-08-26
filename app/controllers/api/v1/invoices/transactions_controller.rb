class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    render json: Transaction.where(invoice_id: params[:invoice_id])
  end

end
