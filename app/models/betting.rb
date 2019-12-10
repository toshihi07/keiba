class Betting < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :race_course, optional: true
  belongs_to :race_number, optional: true
  belongs_to :category, optional: true
  belongs_to :odd, optional: true
  validates :investment,
  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "購入価格は100以上999,999以内で入力してください" }
end
