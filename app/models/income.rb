class Income < ApplicationRecord
  belongs_to :user

  enum income_item: { 給料: 0, 手当て: 1, 退職金: 2, その他: 3 }

  validates :income, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :income_item, presence: true
end
