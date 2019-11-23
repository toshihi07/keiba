class ArticleImage < ApplicationRecord
  belongs_to :article,optional: true
  mount_uploader :image,  ArticleImageUploader
end
