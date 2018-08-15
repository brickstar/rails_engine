require 'rails_helper'

describe "Merchants relationships API" do
  it "sends a list of items for a merchant" do
    merchant = create(:merchant)
    items = create_list(:item, 3, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(3)
    expect(items.first).to have_key(:id)
    expect(items.first).to have_key(:name)
    expect(items.first).to_not have_key(:created_at)
    expect(items.first).to_not have_key(:updated_at)
  end
end
