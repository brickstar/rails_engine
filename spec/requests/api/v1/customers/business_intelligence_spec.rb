require 'rails_helper'

describe "Customers business intelligence API" do
  describe "/customers/favorite_merchant" do
    it "returns merchant who conducted the most successful transactions" do
      customer = create(:customer)
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      create_list(:invoice, 2, customer: customer, merchant: merchant_1)
      create_list(:invoice, 3, customer: customer, merchant: merchant_2)

      get "/api/v1/customers/#{customer.id}/favorite_merchant"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant).to have_key(:name)
      expect(merchant[:id]).to eq(merchant_2.id)
    end
  end
end
