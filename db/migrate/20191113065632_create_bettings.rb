class CreateBettings < ActiveRecord::Migration[5.2]
  def change
    create_table :bettings do |t|

      t.timestamps
    end
  end
end
