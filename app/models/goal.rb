class Goal < ApplicationRecord
  belongs_to :user

  # validates :goal, presence: true
  validates :transportation, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :food, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :entertainment, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :daily, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :gass, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :electron, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :water, presence: true, numericality: { greater_than_or_equal_to: 0  }
  validates :goals_other, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
