class ProportialCostsController < ApplicationController
  def new
    @proportial_cost = ProportialCost.new
    @income_day = params["day"]
    @proportial_costs = ProportialCost.where(day: @income_day)
  end

  def create
    @ProportialCost = ProportialCost.new(proportial_cost_params)
    @ProportialCost.user_id = current_user.id
    if @ProportialCost.save
      redirect_to homes_top_path
    else
    end
  end

  def edit
    @income_day = params["day"]
    @proportial_cost = ProportialCost.find(params[:id])
 end

  def update
    proportial_cost = ProportialCost.find(params[:id])
    proportial_cost.update(proportial_cost_params)

    redirect_to homes_top_path
  end

  def destroy
    proportial_cost = ProportialCost.find(params[:id])
    proportial_cost.destroy

    redirect_to homes_top_path
  end

  private

  def proportial_cost_params
    params.require(:proportial_cost).permit(:day, :proportial_cost, :proportial_cost_item, :proportial_cost_memo)
  end
end
