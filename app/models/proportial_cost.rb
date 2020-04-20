class ProportialCost < ApplicationRecord
  belongs_to :user

  enum proportial_cost_item: { 食費: 0, 交通費: 1, 交際費: 2, 日用品: 3, その他: 4 }

  validates :proportial_cost, presence: true, numericality: { less_than: 0 }
  validates :proportial_cost_item, presence: true

  #配列のソート（昇順）
  default_scope -> { order(day: :asc) }
end
