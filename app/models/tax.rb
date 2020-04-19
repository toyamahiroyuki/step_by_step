class Tax < ApplicationRecord
  belongs_to :fixed_cost

  validates :health, presence: true, numericality: { greater_than: 0 }
  validates :pension, presence: true, numericality: { greater_than: 0 }
  validates :resident, presence: true, numericality: { greater_than: 0 }
  validates :taxes_other, presence: true, numericality: { greater_than: 0 }
end
