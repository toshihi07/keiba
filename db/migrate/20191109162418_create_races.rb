class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|

      t.timestamps
    end
  end
end
