class Post < ApplicationRecord
  belongs_to :race_group
  belongs_to :user

  validates :body, presence: true

end
