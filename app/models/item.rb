class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope -> { order(id: :asc) }

  def self.with_highest_revenue(limit=5)
    Item.select("items.*, sum(invoice_items.quantity*invoice_items.unit_price) as revenue")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.unscoped.success)
    .group(:id)
    .order("revenue DESC")
    .limit(limit)
  end
end
