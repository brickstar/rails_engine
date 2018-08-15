class Api::V1::Merchants::SearchController < ApplicationController
  # def index
  #   render json: Merchant.all
  # end

  def show
    render json: Merchant.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id, :name)
  end
end
