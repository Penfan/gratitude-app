class AddThankIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :thank_id, :integer
    add_index :comments, :thank_id
  end
end
