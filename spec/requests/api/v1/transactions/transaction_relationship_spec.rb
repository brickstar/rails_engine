require 'rails_helper'

describe "Transaction relationships API" do
  it "sends an invoice for a transaction" do
    transaction = create(:transaction)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
  end
end
