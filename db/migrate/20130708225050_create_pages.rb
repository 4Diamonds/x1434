class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :user
      t.references :category
      t.string  :title
      t.string  :url
      t.integer :value
      t.string  :slug
      t.string  :token
      t.boolean :published, default: true
      t.timestamps
    end
    
    add_index :pages, :user_id
    add_index :pages, :category_id
    add_index :pages, :slug
    add_index :pages, :token
  end
end
