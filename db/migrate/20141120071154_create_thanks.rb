class CreateThanks < ActiveRecord::Migration
  def change
    create_table :thanks do |t|
      t.string :text

      t.timestamps
    end
  end
end
