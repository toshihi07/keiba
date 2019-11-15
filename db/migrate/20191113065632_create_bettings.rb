class CreateBettings < ActiveRecord::Migration[5.2]
  def change
    create_table :bettings do |t|
      t.date :when 
      t.string :race_name
      t.integer :income
      t.integer  :investment
      t.references :category
      t.references :race_number
      t.references :race_course
      t.references :result
      t.references :user
      t.timestamps
    end
  end
end
