require 'rails_helper'

describe "Items relationships API" do
  it "sends a list of associated invoice_items for an item" do
    item = create(:item)
    create_list(:invoice_item, 3, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_items.first).to have_key(:id)
    expect(invoice_items.first).to have_key(:item_id)
    expect(invoice_items.first).to have_key(:invoice_id)
    expect(invoice_items.first).to have_key(:quantity)
    expect(invoice_items.first).to have_key(:unit_price)
    expect(invoice_items.first).to_not have_key(:created_at)
    expect(invoice_items.first).to_not have_key(:updated_at)
  end

  it "sends an associated merchant for an item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
    expect(merchant).to_not have_key(:created_at)
    expect(merchant).to_not have_key(:updated_at)
  end
end
