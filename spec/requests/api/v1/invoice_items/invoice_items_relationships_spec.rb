require 'rails_helper'

describe "InvoiceItems relationships API" do
  it "sends associated item for item invoice" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  it "sends a list of invoices for a invoice_item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
  end
end
