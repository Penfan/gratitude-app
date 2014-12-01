class AddUserIdToThanks < ActiveRecord::Migration
  def change
    add_column :thanks, :user_id, :integer
    add_index :thanks, :user_id
  end
end
