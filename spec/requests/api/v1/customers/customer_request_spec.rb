require 'rails_helper'

describe "Customer API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body, symbolize_names: true)

    customer = customers.first

    expect(customers.count).to eq(3)
    expect(customer).to have_key(:id)
    expect(customer).to have_key(:first_name)
    expect(customer).to have_key(:last_name)
    expect(customer).to_not have_key(:created_at)
    expect(customer).to_not have_key(:updated_at)
  end

  it "sends a single customer" do
    customer = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:id)
    expect(customer).to have_key(:first_name)
    expect(customer).to have_key(:last_name)
    expect(customer).to_not have_key(:created_at)
    expect(customer).to_not have_key(:updated_at)
  end

  it "sends a single customer, find by id" do
    customer = create(:customer)

    get "/api/v1/customers/find?id=#{customer.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:id)
    expect(customer).to have_key(:first_name)
    expect(customer).to have_key(:last_name)
    expect(customer).to_not have_key(:created_at)
    expect(customer).to_not have_key(:updated_at)
  end

  it "sends a single customer, find by created_at" do
    created_at = "2012-03-27 14:53:59 UTC"

    customer = create(:customer, created_at: created_at)

    get "/api/v1/customers/find?created_at=#{customer.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:id)
    expect(customer).to have_key(:first_name)
    expect(customer).to have_key(:last_name)
    expect(customer).to_not have_key(:created_at)
    expect(customer).to_not have_key(:updated_at)
  end

  it "sends a single customer, find by updated_at" do
    updated_at = "2012-03-27 14:53:59 UTC"

    customer = create(:customer, updated_at: updated_at)

    get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:id)
    expect(customer).to have_key(:first_name)
    expect(customer).to have_key(:last_name)
    expect(customer).to_not have_key(:created_at)
    expect(customer).to_not have_key(:updated_at)
  end

  it "sends a single customer, find by name" do
    skip
    customer = create(:customer)

    get "/api/v1/customers/find?name=#{customer.name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:id)
    expect(customer).to have_key(:name)
  end

  it "sends a list of customers, find_all by name" do
    skip
    customer_name = 'Matt'

    create(:customer, name: customer_name)
    create(:customer, name: customer_name)

    get "/api/v1/customers/find_all?name=#{customer_name}"

    expect(response).to be_successful

    customers = JSON.parse(response.body, symbolize_names: true)
    customer1 = customers.first
    customer2 = customers.last

    expect(customers.count).to eq(2)
    expect(customer1).to have_key(:id)
    expect(customer1).to have_key(:name)
    expect(customer1[:name]).to eq('Matt')
    expect(customer2).to have_key(:id)
    expect(customer2).to have_key(:name)
    expect(customer2[:name]).to eq('Matt')
  end

  it "sends a random customer" do
    customer = create(:customer)

    get "/api/v1/customers/random"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:id)
    expect(customer).to have_key(:first_name)
  end
end
