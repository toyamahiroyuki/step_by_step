class CostsController < ApplicationController
  def index
  	@proportial_cost0 = ProportialCost.where(proportial_cost_item: "食費").sum(:proportial_cost)
  	@proportial_cost1 = ProportialCost.where(proportial_cost_item: "交通費").sum(:proportial_cost)
  	@proportial_cost2 = ProportialCost.where(proportial_cost_item: "交際費").sum(:proportial_cost)
  	@proportial_cost3 = ProportialCost.where(proportial_cost_item: "日用品").sum(:proportial_cost)

  	@fixed_cost = current_user.fixed_cost
  	@communications = Communication.sum(:phone) + Communication.sum(:wi_fi) + Communication.sum(:communications_other)
    @lifelines = Lifeline.sum(:electron) + Lifeline.sum(:gass) + Lifeline.sum(:water)
    @loans = Loan.sum(:house) + Loan.sum(:lesson) + Loan.sum(:scholarship) + Loan.sum(:loans_other)
    @taxes = Tax.sum(:health) + Tax.sum(:pension) + Tax.sum(:resident) + Tax.sum(:taxes_other)
  end
end
