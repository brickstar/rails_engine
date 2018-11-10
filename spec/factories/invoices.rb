FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status { 0 }
  end
end
