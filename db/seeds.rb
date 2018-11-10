10.times do
  Merchant.create(name: Faker::Company.name)
end

248.times do
  Item.create(name: Faker::Superhero.name, description: Faker::TwinPeaks.quote, unit_price: Faker::Number.between(1, 20), merchant: Merchant.find(Merchant.pluck(:id).sample))
end

100.times do
  Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

484.times do
  Invoice.create(customer: Customer.find(Customer.pluck(:id).sample), merchant: Merchant.find(Merchant.pluck(:id).sample), status: 0)
end

559.times do
  Transaction.create(credit_card_number: Faker::Finance.credit_card(:mastercard), result: 1, invoice: Invoice.find(Invoice.pluck(:id).sample))
end

2168.times do
 InvoiceItem.create(item: Item.find(Item.pluck(:id).sample), invoice: Invoice.find(Invoice.pluck(:id).sample), quantity: Faker::Number.between(1, 10), unit_price: Faker::Number.between(1, 20))
end
