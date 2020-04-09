class TargetItem < ApplicationRecord
  belongs_to :target

   validates :target_by_month, presence: true, numericality: {greater_than: 0  }


  def calc_total_cost
    target_cost - target_items.sum(:target_by_month)
  end
end
