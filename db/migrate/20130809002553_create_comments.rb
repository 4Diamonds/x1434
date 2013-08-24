class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :page
      t.integer :value

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :page_id
  end
end
