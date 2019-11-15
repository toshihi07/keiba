class CreateRaceNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :race_numbers do |t|
      t.string :number
      t.timestamps
    end
  end
end
