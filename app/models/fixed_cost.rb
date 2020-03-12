class FixedCost < ApplicationRecord
  belongs_to :user
  has_many :communications, dependent: :destroy
  has_many :loans, dependent: :destroy
  has_many :balances, dependent: :destroy
end
