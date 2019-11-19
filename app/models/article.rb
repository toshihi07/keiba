class Article < ApplicationRecord
  belongs_to :user
  has_many :artilce_images,dependent: :destroy
  accepts_nested_attributes_for :artilce_images
end
