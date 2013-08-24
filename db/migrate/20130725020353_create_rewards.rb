class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.references :user
      t.string :kind
      t.string :value
      

      t.timestamps
    end
    add_index :rewards, :user_id
  end
end
