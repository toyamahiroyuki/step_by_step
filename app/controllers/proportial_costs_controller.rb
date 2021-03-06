class ProportialCostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @proportial_cost = ProportialCost.new
    @income_day = params["day"]

    render plain: render_to_string(partial: 'new', layout: false, locals: { proportial_cost: @proportial_cost})
  end

  def create
    @ProportialCost = ProportialCost.new(proportial_cost_params)
    @ProportialCost.user_id = current_user.id
    @income_day = params[:day]

    respond_to do |format|
      if @ProportialCost.save
        format.html { redirect_to homes_top_path, notice: 'income was successfully created.' }
      else
        flash[:notice] = "金額には「-」を含めてください。"
        format.js
      end
    end
  end

  def edit
    @proportial_cost = ProportialCost.find(params[:id])
 end

  def update
    proportial_cost = ProportialCost.find(params[:id])

    if proportial_cost.update(proportial_cost_params)

      redirect_to homes_top_path
    else
      # @income_day = params["day"]
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
