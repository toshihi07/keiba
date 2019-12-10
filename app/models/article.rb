class Article < ApplicationRecord
  belongs_to :user
  has_many :article_images,dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :article_images

  def divide_monthly
    return self.articles.group("strftime('%Y%m', articles.created_at)")
                                .order(Arel.sql("strftime('%Y%m', articles.created_at) desc"))
                                .count
  end
end
