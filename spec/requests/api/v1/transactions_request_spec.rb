require 'rails_helper'

describe "Transaction API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions = JSON.parse(response.body, symbolize_names: true)
    transaction = transactions.first

    expect(transactions.count).to eq(3)
    expect(transaction).to have_key(:id)
    expect(transaction).to have_key(:credit_card_number)
    expect(transaction).to have_key(:result)
  end
end
