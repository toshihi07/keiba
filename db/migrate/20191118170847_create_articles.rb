class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text  :title
      t.text  :body
      t.references  :user
      t.timestamps
    end
  end
end
