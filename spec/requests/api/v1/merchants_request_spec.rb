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

  it "sends a single merchant, find by id" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
  end

  it "sends a single merchant, find by created_at" do
    created_at = "2012-03-27 14:53:59 UTC"

    merchant = create(:merchant, created_at: created_at)

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
    expect(merchant).to_not have_key(:created_at)
    expect(merchant).to_not have_key(:updated_at)
  end

  it "sends a single merchant, find by name" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
  end

  it "sends a list of merchants, find_all by name" do
    merchant_name = 'Matt'

    create(:merchant, name: merchant_name)
    create(:merchant, name: merchant_name)

    get "/api/v1/merchants/find_all?name=#{merchant_name}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant1 = merchants.first
    merchant2 = merchants.last

    expect(merchants.count).to eq(2)
    expect(merchant1).to have_key(:id)
    expect(merchant1).to have_key(:name)
    expect(merchant1[:name]).to eq('Matt')
    expect(merchant2).to have_key(:id)
    expect(merchant2).to have_key(:name)
    expect(merchant2[:name]).to eq('Matt')
  end
end
