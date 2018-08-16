class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.with_highest_revenue(limit = 5)
    select("merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue")
    .joins(invoices: :invoice_items).group(:id)
    .order("revenue DESC")
    .limit(limit)
  end

  def self.with_most_items(limit = 5)
    select("merchants.*, sum(invoice_items.quantity) AS item_count")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.unscoped.success)
    .group(:id)
    .order("item_count DESC")
    .limit(limit)
  end
end
