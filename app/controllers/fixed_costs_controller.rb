class FixedCostsController < ApplicationController
  before_action :authenticate_user!
  def new
    if current_user.fixed_cost.nil?
      @fixed_cost = FixedCost.new
      @lifeline = Lifeline.new
    else
      redirect_to fixed_costs_path
    end
  end

  # def index
  # #  @fixed_costs = FixedCost.all
  # #  @lifelines = Lifeline.all
  # end

  def show
    @fixed_cost = current_user.fixed_cost
    @lifeline = current_user.lifeline
  end

  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)
    @lifeline = Lifeline.new(lineline_params)
    @fixed_cost.user_id = current_user.id
    @lifeline.user_id = current_user.id

    if @fixed_cost.save
      @lifeline.save
      redirect_to fixed_costs_path
    else
      @fixed_cost = FixedCost.new
      @lifeline = Lifeline.new
      render action: :new
    end
  end

  def edit
    @fixed_cost = current_user.fixed_cost
    @lifeline = current_user.lifeline
  end

  def update
    @fixed_cost = current_user.fixed_cost
    @lifeline = current_user.lifeline

    if @fixed_cost.update(fixed_cost_params)
      @lifeline.update(lineline_params)

      redirect_to fixed_costs_path
    else
      @fixed_cost = current_user.fixed_cost
      @lifeline = current_user.lifeline
      render action: :edit
    end
   end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:rent, :insurance, :fixed_costs_other)
  end

  def lineline_params
    params.require(:lifeline).permit(:electron, :gass, :water)
  end
end
