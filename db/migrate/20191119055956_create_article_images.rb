class CreateArticleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :article_images do |t|
      t.text :image
      t.references :post_id
      t.timestamps
    end
  end
end
