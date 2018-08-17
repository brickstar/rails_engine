require 'rails_helper'

describe Customer, type: :model do
  describe 'Relationships' do
    it { should have_many :invoices }
    it { should have_many :transactions }
    it { should have_many :merchants }
  end
end
