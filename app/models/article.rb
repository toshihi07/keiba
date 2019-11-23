class Article < ApplicationRecord
  belongs_to :user
  has_many :article_images,dependent: :destroy
  accepts_nested_attributes_for :article_images
end
