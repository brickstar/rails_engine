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

  it "sends a single transaction, find by id" do
    transaction = create(:transaction)

    get "/api/v1/transactions/find?id=#{transaction.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(transaction).to have_key(:id)
    expect(transaction).to have_key(:credit_card_number)
    expect(transaction).to have_key(:result)
  end

  it "sends a single transaction, find by created_at" do
    created_at = "2012-03-27 14:53:59 UTC"

    transaction = create(:transaction, created_at: created_at)

    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(transaction).to have_key(:id)
    expect(transaction).to have_key(:credit_card_number)
    expect(transaction).to have_key(:result)
  end

  it "sends a single transaction, find by updated_at" do
    updated_at = "2012-03-27 14:53:59 UTC"

    transaction = create(:transaction, updated_at: updated_at)

    get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(transaction).to have_key(:id)
    expect(transaction).to have_key(:credit_card_number)
    expect(transaction).to have_key(:result)
  end

  it "sends a single transaction, find by credit_card_number" do
    transaction = create(:transaction)

    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(transaction).to have_key(:id)
    expect(transaction).to have_key(:credit_card_number)
    expect(transaction).to have_key(:result)
  end

  it "sends a list of transactions, find_all by credit_card_number" do
    transaction_credit_card_number = '4540842003561938'

    create(:transaction, credit_card_number: transaction_credit_card_number)
    create(:transaction, credit_card_number: transaction_credit_card_number)

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction_credit_card_number}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body, symbolize_names: true)
    transaction1 = transactions.first
    transaction2 = transactions.last

    expect(transactions.count).to eq(2)
    expect(transaction1).to have_key(:id)
    expect(transaction1).to have_key(:credit_card_number)
    expect(transaction1).to have_key(:result)
    expect(transaction1[:credit_card_number]).to eq('4540842003561938')
    expect(transaction2).to have_key(:id)
    expect(transaction2).to have_key(:credit_card_number)
    expect(transaction2).to have_key(:result)
    expect(transaction2[:credit_card_number]).to eq('4540842003561938')
  end

  it "sends a random transaction" do
    transaction = create(:transaction)

    get "/api/v1/transactions/random"

    expect(response).to be_successful

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(transaction).to have_key(:id)
    expect(transaction).to have_key(:credit_card_number)
    expect(transaction).to have_key(:result)
  end
end
