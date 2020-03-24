class Loan < ApplicationRecord
  belongs_to :fixed_cost
  has_many :loan_items, dependent: :destroy
end
