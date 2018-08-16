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

  it "sends a single invoice_item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:invoice_id)
    expect(invoice_item).to have_key(:item_id)
    expect(invoice_item).to have_key(:quantity)
    expect(invoice_item).to have_key(:unit_price)
    expect(invoice_item).to_not have_key(:created_at)
    expect(invoice_item).to_not have_key(:updated_at)
  end

  it "sends a single invoice_item, find by id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:invoice_id)
    expect(invoice_item).to have_key(:item_id)
    expect(invoice_item).to have_key(:quantity)
    expect(invoice_item).to have_key(:unit_price)
    expect(invoice_item).to_not have_key(:created_at)
    expect(invoice_item).to_not have_key(:updated_at)
  end

  it "sends a single invoice_item, find by created_at" do
    created_at = "2012-03-27 14:53:59 UTC"

    invoice_item = create(:invoice_item, created_at: created_at)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:invoice_id)
    expect(invoice_item).to have_key(:item_id)
    expect(invoice_item).to have_key(:quantity)
    expect(invoice_item).to have_key(:unit_price)
    expect(invoice_item).to_not have_key(:created_at)
    expect(invoice_item).to_not have_key(:updated_at)
  end

  it "sends a single invoice_item, find by updated_at" do
    updated_at = "2012-03-27 14:53:59 UTC"

    invoice_item = create(:invoice_item, updated_at: updated_at)

    get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:invoice_id)
    expect(invoice_item).to have_key(:item_id)
    expect(invoice_item).to have_key(:quantity)
    expect(invoice_item).to have_key(:unit_price)
    expect(invoice_item).to_not have_key(:created_at)
    expect(invoice_item).to_not have_key(:updated_at)
  end

  it "sends a single invoice_item, find by quantity" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:invoice_id)
    expect(invoice_item).to have_key(:item_id)
    expect(invoice_item).to have_key(:quantity)
    expect(invoice_item).to have_key(:unit_price)
    expect(invoice_item).to_not have_key(:created_at)
    expect(invoice_item).to_not have_key(:updated_at)
  end

  it "sends a list of invoice_items, find_all by unit_price" do
    unit_price = 500

    create(:invoice_item, unit_price: unit_price)
    create(:invoice_item, unit_price: unit_price)

    get "/api/v1/invoice_items/find_all?unit_price=#{unit_price}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body, symbolize_names: true)
    invoice_item1 = invoice_items.first
    invoice_item2 = invoice_items.last

    expect(invoice_items.count).to eq(2)
    expect(invoice_item1).to have_key(:unit_price)
    expect(invoice_item1[:unit_price]).to eq("5.0")
    expect(invoice_item2).to have_key(:unit_price)
    expect(invoice_item2[:unit_price]).to eq("5.0")
  end

  it "sends a random invoice_item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/random"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:name)
  end
end
