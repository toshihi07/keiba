class CreateArticleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :article_images do |t|
      t.text :image
      t.references :article
      t.timestamps
    end
  end
end
