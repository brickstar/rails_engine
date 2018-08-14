class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.invoice :references
      t.bigint :credit_card_number
      t.string :result

      t.timestamps
    end
  end
end
