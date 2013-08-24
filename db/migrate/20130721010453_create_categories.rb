class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string  :slug
      t.boolean :active, default: true
      t.timestamps
    end
    add_index :categories, :slug
  end
end
