class ProportialCostsController < ApplicationController
  def new
   @ProportialCost = ProportialCost.new
  end

  def create
   @ProportialCost = ProportialCost.new(proportial_cost_params)
   @ProportialCost.user_id = current_user.id
   if @ProportialCost.save
   	redirect_to homes_top_path
   else
   end
  end

private
 def proportial_cost_params
   params.require(:proportial_cost).permit(:day, :proportial_cost, :proportial_cost_item, :proportial_cost_memo)
 end

end
