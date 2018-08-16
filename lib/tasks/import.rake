require 'csv'

namespace :import do
  desc "TODO"
  task all: :environment do
    CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
      Merchant.create(row.to_h)
    end

    CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |row|
      Item.create(row.to_h)
    end

    CSV.foreach('./data/customers.csv', headers: true, header_converters: :symbol) do |row|
      Customer.create(row.to_h)
    end

    CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |row|
      Invoice.create(row.to_h)
    end

    CSV.foreach('./data/transactions.csv', headers: true, header_converters: :symbol) do |row|
      Transaction.create(row.to_h.slice(:invoice_id, :credit_card_number, :result, :created_at, :updated_at))
    end

    CSV.foreach('./data/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      InvoiceItem.create(row.to_h)
    end
  end
end
