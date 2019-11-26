class Category < ApplicationRecord
  has_one :betting
  has_ancestry
end
