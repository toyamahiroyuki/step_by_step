class Target < ApplicationRecord
  belongs_to :user
  has_many :target_items, dependent: :destroy

  validates :target_purpose, presence: true
  validates :target_cost, presence: true, numericality: { greater_than: 0 }

  def calc_total_cost
    target_cost - target_items.sum(:target_by_month)
  end
end
