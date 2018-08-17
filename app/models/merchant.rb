class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

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

  def self.total_revenue_by_date(date = "2012-03-16")
    date = date.to_date
    start_date = date.beginning_of_day
    end_date = date.end_of_day

    select("sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.unscoped.success)
    .where("invoices.created_at BETWEEN ? AND ?", start_date, end_date)
    .order("total_revenue DESC")
    .limit(1).take
  end

  def total_revenue_for_merchant
    invoices
    .joins(:invoice_items, :transactions)
    .merge(Transaction.unscoped.success)
    .sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def total_revenue_for_merchant_by_date(date = "2012-03-16")
    date = date.to_date
    start_date = date.beginning_of_day
    end_date = date.end_of_day

    invoices
    .joins(:invoice_items, :transactions)
    .where("invoices.created_at BETWEEN ? AND ?", start_date, end_date)
    .merge(Transaction.unscoped.success)
    .sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def favorite_customer
    customers
    .select('customers.*, count(customers.id) AS customer_count')
    .group(:id)
    .order('customer_count DESC')
    .limit(1)
    .take
  end
end
