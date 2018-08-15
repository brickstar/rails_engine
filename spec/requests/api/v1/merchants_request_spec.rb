require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant = merchants.first

    expect(merchants.count).to eq(3)
    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
    expect(merchant).to_not have_key(:created_at)
    expect(merchant).to_not have_key(:updated_at)
  end
end
