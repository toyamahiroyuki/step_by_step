class CalendarIncomesController < ApplicationController
  # def total_income
  # 	@incomes = Income
  #  		.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
  #  		.where(user_id: current_user.id)
  #  		.group(:day)
  #  		.sum(:income)
  #   render json: @incomes
  # end

  # def total_proportial_cost
  # 	@proportial_costs = ProportialCost
  #  		.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
  #  		.where(user_id: current_user.id)
  #  		.group(:day)
  #  		.sum(:proportial_cost)
  #   render json: @proportial_costs
  # end

  def total
    @incomes = Income
   		.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
   		.where(user_id: current_user.id)
   		.group(:day)
   		.sum(:income)

  	@proportial_costs = ProportialCost
   		.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
   		.where(user_id: current_user.id)
   		.group(:day)
   		.sum(:proportial_cost)

    @total = @incomes.merge(@proportial_costs){|day, incomes , proportial_costs |(incomes-proportial_costs)}
             p @total
             # binding.pry
    render json: @total
  end
end
