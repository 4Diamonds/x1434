class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      t.references :user
      t.string :gateway
      t.float :value
      t.boolean :paid, default: false

      t.timestamps
    end
    add_index :withdraws, :user_id
    
  end
end
