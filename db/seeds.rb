require 'faker'

248.times do
  create(:item)
end

100.times do
  create(:customer)
end

10.times do
  create(:merchant)
end

484.times do
  create(:invoice)
end

559.times do
  create(:transaction)
end

2168.times do
  create(:invoice_item)
end
