class AddColumnToBettingsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :bettings, :horse_number, :string
    remove_column :bettings, :income, :integer
    remove_column :bettings, :result_id, :reference
    add_column :bettings, :result, :integer
  end
end
