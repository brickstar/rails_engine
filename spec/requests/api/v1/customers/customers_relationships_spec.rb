require 'rails_helper'

describe "Customers relationships API" do
  it "sends a list of items for a customer" do
    customer = create(:customer)
    invoices = create_list(:invoice, 3, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(invoices.count).to eq(3)
    expect(invoices.first).to have_key(:id)
    expect(invoices.first).to have_key(:customer_id)
    expect(invoices.first).to have_key(:merchant_id)
    expect(invoices.first).to have_key(:status)
    expect(invoices.first).to_not have_key(:created_at)
    expect(invoices.first).to_not have_key(:updated_at)
  end

  it "sends a list of transactions for a customer" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    transactions = create_list(:transaction, 3, invoice: invoice)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(transactions.count).to eq(3)
    expect(transactions.first).to have_key(:id)
    expect(transactions.first).to have_key(:invoice_id)
    expect(transactions.first).to have_key(:credit_card_number)
    expect(transactions.first).to have_key(:result)
  end
end
