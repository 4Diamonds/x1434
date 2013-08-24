class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user
      t.float :cash
      t.integer :coins

      t.timestamps
    end
    add_index :accounts, :user_id
  end
end
