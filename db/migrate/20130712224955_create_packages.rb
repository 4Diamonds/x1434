class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
    	t.string :cat
      t.string :title
      t.integer :coins
      t.float :cash
      t.float :value
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
