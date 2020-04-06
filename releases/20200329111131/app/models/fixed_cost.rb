class FixedCost < ApplicationRecord
  belongs_to :user
  has_one :communication, dependent: :destroy
  has_one :loan, dependent: :destroy
  has_one :tax, dependent: :destroy
end
