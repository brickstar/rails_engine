require 'rails_helper'

describe "Merchants business intelligence API" do
  before(:each) do
    date1 = "2012-03-16"
    date2 = "1999-12-31"
    @customer = create(:customer)
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    @merchant3 = create(:merchant)
    @invoice1 = create(:invoice, customer: @customer, merchant: @merchant1, created_at: date1)
    @invoice2 = create(:invoice, customer: @customer, merchant: @merchant2, created_at: date1)
    @invoice3 = create(:invoice, customer: @customer, merchant: @merchant3, created_at: date2)
    transaction1 = create(:transaction, invoice: @invoice1)
    transaction2 = create(:transaction, invoice: @invoice2)
    transaction3 = create(:transaction, invoice: @invoice3)
    create_list(:invoice_item, 5, invoice: @invoice1)
    create_list(:invoice_item, 3, invoice: @invoice2)
    create_list(:invoice_item, 1, invoice: @invoice3)
  end

  describe "/merchants/most_revenue" do
    it "sends a list of merchants with most revenue" do
      get "/api/v1/merchants/most_revenue?quantity=2"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(2)
      expect(merchants.first).to have_key(:id)
      expect(merchants.first).to have_key(:name)
      expect(merchants[0][:id]).to eq(@merchant1.id)
      expect(merchants[1][:id]).to eq(@merchant2.id)
      expect(merchants.first).to_not have_key(:created_at)
      expect(merchants.first).to_not have_key(:updated_at)

      get "/api/v1/merchants/most_revenue?quantity=1"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(1)
      expect(merchants.first).to have_key(:id)
      expect(merchants.first).to have_key(:name)
      expect(merchants[0][:id]).to eq(@merchant1.id)
      expect(merchants.first).to_not have_key(:created_at)
      expect(merchants.first).to_not have_key(:updated_at)
    end
  end

  describe "/merchants/most_items" do
    it "sends a list of merchants with most items" do
      get "/api/v1/merchants/most_items?quantity=2"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(2)
      expect(merchants.first).to have_key(:id)
      expect(merchants.first).to have_key(:name)
      expect(merchants[0][:id]).to eq(@merchant1.id)
      expect(merchants[1][:id]).to eq(@merchant2.id)
      expect(merchants.first).to_not have_key(:created_at)
      expect(merchants.first).to_not have_key(:updated_at)

      get "/api/v1/merchants/most_items?quantity=1"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(1)
      expect(merchants.first).to have_key(:id)
      expect(merchants.first).to have_key(:name)
      expect(merchants[0][:id]).to eq(@merchant1.id)
      expect(merchants.first).to_not have_key(:created_at)
      expect(merchants.first).to_not have_key(:updated_at)
    end
  end

  describe "/merchants/revenue" do
    it "returns total revenue for date across all merchants" do
      get "/api/v1/merchants/revenue?date=2012-03-16"

      expect(response).to be_successful

      total_revenue = JSON.parse(response.body, symbolize_names: true)

      expect(total_revenue).to have_key(:total_revenue)
      expect(total_revenue[:total_revenue]).to eq("0.08")
      expect(total_revenue).to_not have_key(:created_at)
      expect(total_revenue).to_not have_key(:updated_at)

      get "/api/v1/merchants/revenue?date=2019-03-16"

      expect(response).to be_successful

      total_revenue = JSON.parse(response.body, symbolize_names: true)

      expect(total_revenue).to have_key(:total_revenue)
      expect(total_revenue[:total_revenue]).to eq("0")
    end
  end
end
