class ChangeStringToCitext < ActiveRecord::Migration[5.2]
  def change
    enable_extension("citext")

    change_column :customers, :first_name, :citext
    change_column :customers, :last_name, :citext

    change_column :items, :name, :citext
    change_column :items, :description, :citext

    change_column :merchants, :name, :citext

    change_column :transactions, :credit_card_number, :citext
  end
end
