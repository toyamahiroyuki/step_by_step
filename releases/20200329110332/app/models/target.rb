class Target < ApplicationRecord
  belongs_to :user
  has_many :target_items, dependent: :destroy

  def calc_total_cost
    target_cost - target_items.sum(:target_by_month)
  end
end
