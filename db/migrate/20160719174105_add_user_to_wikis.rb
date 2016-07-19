class AddUserToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :user_id, :integer
    add_index :wikis, :user_id
  end
end
