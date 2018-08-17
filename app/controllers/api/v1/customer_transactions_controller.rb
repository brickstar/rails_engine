class Api::V1::CustomerTransactionsController < ApplicationController

  def index
    render json: Customer.find(params[:customer_id]).transactions
  end

end
