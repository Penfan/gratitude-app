class AddAllVisToThank < ActiveRecord::Migration
  def change
    add_column :thanks, :all_vis, :boolean
  end
end
