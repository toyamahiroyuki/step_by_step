class Loan < ApplicationRecord
  belongs_to :fixed_cost
  has_many :loan_items, dependent: :destroy

  validates :loan_purpose, presence: true
  validates :loan_cost, presence: true, numericality: { greater_than: 0 }
end
