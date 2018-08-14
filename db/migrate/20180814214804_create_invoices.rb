class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.customer :references
      t.merchant :references
      t.string :status

      t.timestamps
    end
  end
end
