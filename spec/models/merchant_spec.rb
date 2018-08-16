require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'class methods' do
    it '.with_highest_revenue' do
      customer = create(:customer)
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      invoice1 = create(:invoice, customer: customer, merchant: merchant1)
      invoice2 = create(:invoice, customer: customer, merchant: merchant2)
      invoice3 = create(:invoice, customer: customer, merchant: merchant3)
      create_list(:invoice_item, 5, invoice: invoice1)
      create_list(:invoice_item, 3, invoice: invoice2)
      create_list(:invoice_item, 1, invoice: invoice3)

      expect(Merchant.with_highest_revenue(2)).to eq([merchant1, merchant2])
      expect(Merchant.with_highest_revenue(1)).to eq([merchant1])
    end
  end
end
