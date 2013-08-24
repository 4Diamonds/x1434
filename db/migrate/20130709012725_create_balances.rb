class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.references :account
      t.string :kind
      t.string :title
      t.integer :value
      t.integer :current_coins
      t.float :current_cash
      
      t.timestamps
    end
    add_index :balances, :account_id
  end
end
