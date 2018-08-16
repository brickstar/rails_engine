require 'rails_helper'

describe "Merchants business intelligence API" do
  it "sends a list of merchants with most revenue" do
    customer = create(:customer)
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)
    invoice1 = create(:invoice, customer: customer, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer, merchant: merchant2)
    invoice3 = create(:invoice, customer: customer, merchant: merchant3)
    create_list(:invoice_item, 5, invoice: invoice1)
    create_list(:invoice_item, 3, invoice: invoice2)
    create_list(:invoice_item, 1, invoice: invoice3)

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants.count).to eq(2)
    expect(merchants.first).to have_key(:id)
    expect(merchants.first).to have_key(:name)
    expect(merchants[0][:id]).to eq(merchant1.id)
    expect(merchants[1][:id]).to eq(merchant2.id)
    expect(merchants.first).to_not have_key(:created_at)
    expect(merchants.first).to_not have_key(:updated_at)
  end
end
