require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)
    item = items.first

    expect(items.count).to eq(3)
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  it "sends a single item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  it "sends a single item, find by id" do
    item = create(:item)

    get "/api/v1/items/find?id=#{item.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  it "sends a single item, find by created_at" do
    created_at = "2012-03-27 14:53:59 UTC"

    item = create(:item, created_at: created_at)

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  it "sends a single item, find by updated_at" do
    updated_at = "2012-03-27 14:53:59 UTC"

    item = create(:item, updated_at: updated_at)

    get "/api/v1/items/find?updated_at=#{item.updated_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  it "sends a single item, find by name" do
    item = create(:item)

    get "/api/v1/items/find?name=#{item.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  it "sends a list of items, find_all by name" do
    item_name = 'Matt'

    create(:item, name: item_name)
    create(:item, name: item_name)

    get "/api/v1/items/find_all?name=#{item_name}"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)
    item1 = items.first
    item2 = items.last

    expect(items.count).to eq(2)
    expect(item1).to have_key(:id)
    expect(item1).to have_key(:name)
    expect(item1[:name]).to eq('Matt')
    expect(item2).to have_key(:id)
    expect(item2).to have_key(:name)
    expect(item2[:name]).to eq('Matt')
  end

  it "sends a random item" do
    item = create(:item)

    get "/api/v1/items/random"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
  end
end
