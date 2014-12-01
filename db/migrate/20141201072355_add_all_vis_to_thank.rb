class AddAllVisToThank < ActiveRecord::Migration
  def change
    add_column :thanks, :allVis, :boolean
  end
end
