class TargetsController < ApplicationController
  def new
    @target = Target.new
  end

  def index
  	@targets = Target.all
    @target_item = TargetItem.new
    @target_items = TargetItem.all
    @loans = Loan.all
    @loan_items = LoanItem.all
  end

  def create
  	target = Target.new(target_params)
    target.user_id = current_user.id
    target.save

    # target_item = TargetItem.new(target_item_params)
    # target_item.target_id = target.id
    # target_item.target_balance = target.target_cost - target_item.target_by_month

    # if target_item.save

      redirect_to targets_path
    # else
    # end
  end

  # def show
  #   @target = Target.find(params[:id])
  #   @loan = Loan.find(params[:id])
  # end

  def edit
  	@target = Target.find(params[:id])
    # @target_item = TargetItem.find_by(params[:id])
  end

  def update
  	target = Target.find(params[:id])
    target_item = TargetItem.find(params[:id])
    target.target_balance = target.target_cost - target_item.target_by_month

    if target.update(target_params)
       # target_item.update(target_item_params)

  	   redirect_to targets_path
    else
    end
  end
  def destroy
    target = Target.find(params[:id])
    target.destroy

    redirect_to targets_path
  end

private
  def target_params
    params.require(:target).permit(:target_purpose, :target_cost, :target_by_month)
  end

  # def target_item_params
  #   params.require(:target_item).permit(:id, :target_by_month, :target_balance)
  # end

end
