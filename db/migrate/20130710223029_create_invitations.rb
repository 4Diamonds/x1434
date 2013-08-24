class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :user
      t.string  :name
      t.string  :email
      t.boolean :accept, default: false
      t.string  :token
      t.string  :slug
      t.timestamps
    end
    add_index :invitations, :user_id
    add_index :invitations, :token
    add_index :invitations, :slug
  end
end
