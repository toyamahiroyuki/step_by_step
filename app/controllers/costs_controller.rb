class CostsController < ApplicationController
  def index
  	@proportial_cost0 = ProportialCost.where(proportial_cost_item: "食費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
  	@proportial_cost1 = ProportialCost.where(proportial_cost_item: "交通費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
  	@proportial_cost2 = ProportialCost.where(proportial_cost_item: "交際費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
  	@proportial_cost3 = ProportialCost.where(proportial_cost_item: "日用品", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)

  	@fixed_cost = current_user.fixed_cost
  	@communications = Communication.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:phone) + Communication.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:wi_fi) + Communication.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:communications_other)
    @lifelines = Lifeline.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:electron) + Lifeline.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:gass) + Lifeline.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:water)
    @loan_items = LoanItem.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:loan_by_month)
    @target_items = TargetItem.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:target_by_month)
    @taxes = Tax.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:health) + Tax.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:pension) + Tax.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:resident) + Tax.sum(:taxes_other)
  end
end


