require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant = merchants.first

    expect(merchants.count).to eq(3)
    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
    expect(merchant).to_not have_key(:created_at)
    expect(merchant).to_not have_key(:updated_at)
  end

  it "sends a single merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
    expect(merchant).to_not have_key(:created_at)
    expect(merchant).to_not have_key(:updated_at)
  end

  xit "sends a single merchant, find by id" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
  end

  it "sends a single merchant, find by name" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
  end
end
