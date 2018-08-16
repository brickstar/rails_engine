class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :unit_price, :quantity

  def unit_price
    (object.unit_price / 100.0).to_s
  end
end
