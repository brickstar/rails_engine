require 'rails_helper'

describe "Invoices relationships API" do
  it "sends a list of transactions for an invoice" do
    invoice = create(:invoice)
    transactions = create_list(:transaction, 3, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(transactions.count).to eq(3)
    expect(transactions.first).to have_key(:id)
    expect(transactions.first).to have_key(:invoice_id)
    expect(transactions.first).to have_key(:credit_card_number)
    expect(transactions.first).to have_key(:result)
    expect(transactions.first).to_not have_key(:created_at)
    expect(transactions.first).to_not have_key(:updated_at)
  end

  it "sends a list of invoice_items for an invoice" do
    invoice = create(:invoice)
    invoice_items = create_list(:invoice_item, 3, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first).to have_key(:id)
    expect(invoice_items.first).to have_key(:item_id)
    expect(invoice_items.first).to have_key(:invoice_id)
    expect(invoice_items.first).to have_key(:quantity)
    expect(invoice_items.first).to have_key(:unit_price)
  end

  it "sends a list of items for an invoice" do
    invoice = create(:invoice)
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)
    create(:invoice_item, item: item_1, invoice: invoice)
    create(:invoice_item, item: item_2, invoice: invoice)
    create(:invoice_item, item: item_3, invoice: invoice)
    create(:invoice_item, item: item_1)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(3)
    expect(items.first).to have_key(:id)
    expect(items.first).to have_key(:name)
    expect(items.first).to have_key(:description)
    expect(items.first).to have_key(:unit_price)
    expect(items.first).to have_key(:merchant_id)

  end
  
  it "sends a customer for an invoice" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:id)
    expect(customer).to have_key(:customer_id)
    expect(customer).to have_key(:merchant_id)
    expect(customer).to have_key(:status)
  end
end
