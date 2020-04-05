class TargetItem < ApplicationRecord
  belongs_to :target

  def calc_total_cost
    target_cost - target_items.sum(:target_by_month)
  end
end
