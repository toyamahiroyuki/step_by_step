class Communication < ApplicationRecord
  belongs_to :fixed_cost

  validates :phone, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :wi_fi, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :communications_other, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
