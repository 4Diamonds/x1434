class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.references :package
      t.string :gateway
      t.float :value
      t.boolean :return
      t.boolean :paid, default: false

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :package_id
  end
end
