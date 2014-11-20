class AddMinistryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ministry, :string
  end
end
