class CostsController < ApplicationController
  def show
    if current_user.fixed_cost == nil
       redirect_to homes_top_path
    else
      user = User.find(params[:id])

    	@proportial_cost0 = user.proportial_costs.where(proportial_cost_item: "食費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    	@proportial_cost1 = user.proportial_costs.where(proportial_cost_item: "交通費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    	@proportial_cost2 = user.proportial_costs.where(proportial_cost_item: "交際費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    	@proportial_cost3 = user.proportial_costs.where(proportial_cost_item: "日用品", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)

    	@fixed_cost = user.fixed_cost

      @fixed_costs = user.fixed_cost.rent.to_i + user.fixed_cost.insurance.to_i + user.fixed_cost.fixed_costs_other.to_i

    	@communications = Communication.where(fixed_cost_id: user.fixed_cost.id,created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:phone)+ Communication.where(fixed_cost_id: user.fixed_cost.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:wi_fi)+ Communication.where(fixed_cost_id: user.fixed_cost.id ,created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:communications_other)

      @lifelines = Lifeline.where(user_id: user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:electron)+ Lifeline.where(user_id: user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:gass)+ Lifeline.where(user_id: user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:water)


      loans = Loan.where(fixed_cost_id: user.fixed_cost.id)
      loan_ids = []
      loans.each do |loan|
        loan_ids.push(loan.id)
      end
      @loan_items = LoanItem
        .where(loan_id: loan_ids)
        .where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
        .sum(:loan_by_month)

      targets = user.targets
        targets.each do |target|

          @target_items = TargetItem.where(target_id: target.id,created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:target_by_month)

        end
      @taxes = Tax.where(fixed_cost_id: user.fixed_cost.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:health) + Tax.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:pension) + Tax.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:resident)+ Tax.sum(:taxes_other)
     
      @total_cost = @proportial_cost0 + @proportial_cost1 + @proportial_cost2 + @proportial_cost3 + @fixed_costs + @communications + @lifelines + @loan_items.to_i + @target_items.to_i + @taxes
   end
  end
end


