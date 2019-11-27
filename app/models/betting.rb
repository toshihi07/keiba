class Betting < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :race_course, optional: true
  belongs_to :race_number, optional: true
  belongs_to :category, optional: true
  belongs_to :odd, optional: true
end
