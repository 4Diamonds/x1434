class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :user
      t.references :page
      t.integer :value

      t.timestamps
    end
    add_index :followers, :user_id
    add_index :followers, :page_id
  end
end
