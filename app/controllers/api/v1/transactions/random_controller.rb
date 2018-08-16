class Api::V1::Transactions::RandomController < ApplicationController
  def show
    render json: Transaction.unscoped.order("RANDOM()").first
  end
end
