class CreateRaceGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :race_groups do |t|
      t.string :name
      t.integer :year
      t.timestamps
    end
  end
end
