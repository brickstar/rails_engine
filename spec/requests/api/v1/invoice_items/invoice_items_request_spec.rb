require 'rails_helper'

describe "InvoiceItems API" do
  it "sends a list of invoice_items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body, symbolize_names: true)
    invoice_item = invoice_items.first

    expect(invoice_items.count).to eq(3)
    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:item_id)
    expect(invoice_item).to have_key(:invoice_id)
    expect(invoice_item).to have_key(:quantity)
    expect(invoice_item).to have_key(:unit_price)
    expect(invoice_item).to_not have_key(:created_at)
    expect(invoice_item).to_not have_key(:updated_at)
  end

  # it "sends a single invoice_item" do
  #   invoice_item = create(:merchant)
  #
  #   get "/api/v1/merchants/#{merchant.id}"
  #
  #   expect(response).to be_successful
  #
  #   merchant = JSON.parse(response.body, symbolize_names: true)
  #
  #   expect(merchant).to have_key(:id)
  #   expect(merchant).to have_key(:name)
  #   expect(merchant).to_not have_key(:created_at)
  #   expect(merchant).to_not have_key(:updated_at)
  # end
  #
  # it "sends a single merchant, find by id" do
  #   merchant = create(:merchant)
  #
  #   get "/api/v1/merchants/find?id=#{merchant.id}"
  #
  #   expect(response).to be_successful
  #
  #   merchant = JSON.parse(response.body, symbolize_names: true)
  #
  #   expect(merchant).to have_key(:id)
  #   expect(merchant).to have_key(:name)
  # end
  #
  # it "sends a single merchant, find by created_at" do
  #   created_at = "2012-03-27 14:53:59 UTC"
  #
  #   merchant = create(:merchant, created_at: created_at)
  #
  #   get "/api/v1/merchants/find?created_at=#{merchant.created_at}"
  #
  #   expect(response).to be_successful
  #
  #   merchant = JSON.parse(response.body, symbolize_names: true)
  #
  #   expect(merchant).to have_key(:id)
  #   expect(merchant).to have_key(:name)
  #   expect(merchant).to_not have_key(:created_at)
  #   expect(merchant).to_not have_key(:updated_at)
  # end
  #
  # it "sends a single merchant, find by updated_at" do
  #   updated_at = "2012-03-27 14:53:59 UTC"
  #
  #   merchant = create(:merchant, updated_at: updated_at)
  #
  #   get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"
  #
  #   expect(response).to be_successful
  #
  #   merchant = JSON.parse(response.body, symbolize_names: true)
  #
  #   expect(merchant).to have_key(:id)
  #   expect(merchant).to have_key(:name)
  #   expect(merchant).to_not have_key(:created_at)
  #   expect(merchant).to_not have_key(:updated_at)
  # end
  #
  # it "sends a single merchant, find by name" do
  #   merchant = create(:merchant)
  #
  #   get "/api/v1/merchants/find?name=#{merchant.name}"
  #
  #   expect(response).to be_successful
  #
  #   merchant = JSON.parse(response.body, symbolize_names: true)
  #
  #   expect(merchant).to have_key(:id)
  #   expect(merchant).to have_key(:name)
  # end
  #
  # it "sends a list of merchants, find_all by name" do
  #   merchant_name = 'Matt'
  #
  #   create(:merchant, name: merchant_name)
  #   create(:merchant, name: merchant_name)
  #
  #   get "/api/v1/merchants/find_all?name=#{merchant_name}"
  #
  #   expect(response).to be_successful
  #
  #   merchants = JSON.parse(response.body, symbolize_names: true)
  #   merchant1 = merchants.first
  #   merchant2 = merchants.last
  #
  #   expect(merchants.count).to eq(2)
  #   expect(merchant1).to have_key(:id)
  #   expect(merchant1).to have_key(:name)
  #   expect(merchant1[:name]).to eq('Matt')
  #   expect(merchant2).to have_key(:id)
  #   expect(merchant2).to have_key(:name)
  #   expect(merchant2[:name]).to eq('Matt')
  # end
  #
  # it "sends a random merchant" do
  #   merchant = create(:merchant)
  #
  #   get "/api/v1/merchants/random"
  #
  #   expect(response).to be_successful
  #
  #   merchant = JSON.parse(response.body, symbolize_names: true)
  #
  #   expect(merchant).to have_key(:id)
  #   expect(merchant).to have_key(:name)
  # end
end
