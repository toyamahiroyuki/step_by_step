class FixedCost < ApplicationRecord
  belongs_to :user
  has_one :communication, dependent: :destroy
  has_one :loan, dependent: :destroy
  has_one :tax, dependent: :destroy

  validates :rent, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :insurance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :fixed_costs_other, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
