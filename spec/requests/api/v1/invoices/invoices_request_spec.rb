require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoices" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice = invoices.first

    expect(invoices.count).to eq(3)
    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
    expect(invoice).to_not have_key(:created_at)
    expect(invoice).to_not have_key(:updated_at)
  end

  it "sends a single invoice" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
    expect(invoice).to_not have_key(:created_at)
    expect(invoice).to_not have_key(:updated_at)
  end

  it "sends a single invoice, find by id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
  end

  it "sends a single invoice, find by customer_id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
  end

  it "sends a single invoice, find by merchant_id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
  end

  it "sends a single invoice, find by status" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?status=#{invoice.status}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
  end

  it "sends a single invoice, find by created_at" do
    created_at = "2012-03-27 14:53:59 UTC"

    invoice = create(:invoice, created_at: created_at)

    get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
    expect(invoice).to_not have_key(:created_at)
    expect(invoice).to_not have_key(:updated_at)
  end

  it "sends a single invoice, find by updated_at" do
    updated_at = "2012-03-27 14:53:59 UTC"

    invoice = create(:invoice, updated_at: updated_at)

    get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
    expect(invoice).to_not have_key(:created_at)
    expect(invoice).to_not have_key(:updated_at)
  end

  it "sends a random invoice" do
    invoice = create(:invoice)

    get "/api/v1/invoices/random"

    expect(response).to be_successful

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:status)
  end
end
