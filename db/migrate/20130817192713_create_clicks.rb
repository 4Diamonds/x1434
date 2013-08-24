class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.references :page
      t.references :user
      t.integer :value
      t.string :kind

      t.timestamps
    end
    add_index :clicks, :page_id
    add_index :clicks, :user_id
  end
end
