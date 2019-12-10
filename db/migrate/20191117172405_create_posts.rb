class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :prediction
      t.text :body,null: false
      t.references :race_group,foreign_key: true
      t.references :user,foreign_key: true
      t.timestamps

      def iine?(user)
        iine_users.include?(user)
      end
      
    end
  end
end
