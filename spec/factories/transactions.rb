FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Finance.credit_card(:mastercard) }
    result { 1 }
    invoice
  end
end
