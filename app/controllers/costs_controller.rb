class CostsController < ApplicationController
  def index
    if current_user.fixed_cost == nil
       redirect_to homes_top_path
    else
    	@proportial_cost0 = current_user.proportial_costs.where(proportial_cost_item: "食費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    	@proportial_cost1 = current_user.proportial_costs.where(proportial_cost_item: "交通費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    	@proportial_cost2 = current_user.proportial_costs.where(proportial_cost_item: "交際費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    	@proportial_cost3 = current_user.proportial_costs.where(proportial_cost_item: "日用品", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)

    	@fixed_cost = current_user.fixed_cost

      @fixed_costs = current_user.fixed_cost.rent.to_i + current_user.fixed_cost.insurance.to_i + current_user.fixed_cost.fixed_costs_other.to_i

    	@communications = Communication.where(fixed_cost_id: current_user.fixed_cost.id,created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:phone)+ Communication.where(fixed_cost_id: current_user.fixed_cost.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:wi_fi)+ Communication.where(fixed_cost_id: current_user.fixed_cost.id ,created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:communications_other)

      @lifelines = Lifeline.where(user_id: current_user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:electron)+ Lifeline.where(user_id: current_user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:gass)+ Lifeline.where(user_id: current_user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:water)


      loans = Loan.where(fixed_cost_id: current_user.fixed_cost.id)
      loan_ids = []
      loans.each do |loan|
        loan_ids.push(loan.id)
      end
      @loan_items = LoanItem
        .where(loan_id: loan_ids)
        .where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
        .sum(:loan_by_month)

      targets = current_user.targets
        targets.each do |target|

          @target_items = TargetItem.where(target_id: target.id,created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:target_by_month)

        end

      @taxes = Tax.where(fixed_cost_id: current_user.fixed_cost.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:health)+ Tax.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:pension)+ Tax.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:resident)+ Tax.sum(:taxes_other)

      @total_cost = @proportial_cost0 + @proportial_cost1 + @proportial_cost2 + @proportial_cost3 + @fixed_costs + @communications + @lifelines + @loan_items.to_i + @target_items.to_i + @taxes
   end
  end
end


