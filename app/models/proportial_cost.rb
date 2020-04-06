class ProportialCost < ApplicationRecord
  belongs_to :user

  enum proportial_cost_item: { 食費: 0, 交通費: 1, 交際費: 2, 日用品: 3, その他: 4 }

  validates :proportial_cost,numericality: { only_integer: true, less_than: 0 }
end