class ProportialCostsController < ApplicationController
    before_action :authenticate_user!
  def new
    @proportial_cost = ProportialCost.new
    @income_day = params["day"]
    @proportial_costs = ProportialCost.where(day: @income_day)
  end

  def create
    @ProportialCost = ProportialCost.new(proportial_cost_params)
    @ProportialCost.user_id = current_user.id
    @income_day = params[:day]
    if @ProportialCost.save
      redirect_to homes_top_path
    else
      flash[:notice] = "金額には「-」を含めてください。"
      redirect_to new_proportial_cost_path(day: @income_day )
    end
  end

  def edit
    @income_day = params["day"]
    @proportial_cost = ProportialCost.find(params[:id])
 end

  def update
    proportial_cost = ProportialCost.find(params[:id])
    if proportial_cost.update(proportial_cost_params)

       redirect_to homes_top_path
    else
       @income_day = params["day"]
       @proportial_cost = ProportialCost.find(params[:id])
       render action: :edit
    end
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
