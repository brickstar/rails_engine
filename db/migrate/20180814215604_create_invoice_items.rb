class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.item :references
      t.invoice :references
      t.int :quantity
      t.int :unit_price

      t.timestamps
    end
  end
end
