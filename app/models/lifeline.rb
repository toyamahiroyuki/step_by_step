class Lifeline < ApplicationRecord
  belongs_to :user

  validates :electron, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :gass, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :water, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
