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

  def self.with_most_items(limit=5)
    select("items.*, sum(invoice_items.quantity) AS item_count")
    .joins(invoices: :transactions)
    .merge(Transaction.unscoped.success)
    .group(:id)
    .order("item_count DESC")
    .limit(limit)
  end

  def best_day
    invoices
    .select('invoices.updated_at, sum(invoice_items.quantity) AS invoice_count')
    .joins(:invoice_items)
    .group(:updated_at, :id)
    .order('invoice_count DESC, invoices.updated_at DESC')
    .limit(1)
    .take
  end
end
