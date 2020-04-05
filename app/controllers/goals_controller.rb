class GoalsController < ApplicationController
  def new
    if current_user.goals.empty?
      @goal = Goal.new
    else
      redirect_to goal_path(current_user.goals.first)
    end
  end

  def create
    goal = Goal.new(goal_params)
    goal.user_id = current_user.id
    if goal.save
      redirect_to goal_path(goal.id)
    else
    end
  end

  def index
  end

  def show
    @goals = current_user.goals

    @proportial_cost0 = current_user.proportial_costs.where(proportial_cost_item: "食費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    @proportial_cost1 = current_user.proportial_costs.where(proportial_cost_item: "交通費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    @proportial_cost2 = current_user.proportial_costs.where(proportial_cost_item: "交際費", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    @proportial_cost3 = current_user.proportial_costs.where(proportial_cost_item: "日用品", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)
    @proportial_cost4 = current_user.proportial_costs.where(proportial_cost_item: "その他", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:proportial_cost)

    @lifelines_gass = Lifeline.where(user_id: current_user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:electron)
    @lifelines_electron = Lifeline.where(user_id: current_user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:gass)
    @lifeline_water = Lifeline.where(user_id: current_user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:water)
  end

  def edit
    @goal = Goal.find_by(params[:user_id])
  end

  def update
    goal = Goal.find_by(params[:user_id])
    goal.update(goal_params)

    redirect_to goal_path
  end

  def destroy
    goal = Goal.find_by(params[:user_id])
    goal.destroy

    redirect_to homes_top_path
  end

  private

  def goal_params
    params.require(:goal).permit(:transportation, :food, :entertainment, :daily, :gass, :electron, :water, :goals_other)
  end
end
