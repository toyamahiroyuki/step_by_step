class TargetItemsController < ApplicationController
  def create
  	@target_item = TargetItem.new(target_item_params)
  	if @target_item.save
  		redirect_to targets_path
    else
		@targets = Target.all
		# @target_items = TargetItem.all
		@loans = Loan.all
		@loan_items = LoanItem.all
    	render 'targets/index'
    end

  end


  def index
  end

  def edit
  	@target_item = TargetItem.find(target_item_params)
  end

  def update
  	target_item = TargetItem.find(target_item_params)
    target.update

    redirect_to targets_path
  end

  def destroy
  	@target_item = TargetItem.find(target_item_params)
  end

private
  def target_item_params
    params.require(:target_item).permit(:target_id, :target_by_month, :target_balance)
  end
end
