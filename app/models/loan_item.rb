class LoanItem < ApplicationRecord
  belongs_to :loan

  validates :loan_by_month, presence: true, numericality: { greater_than: 0 }
end
