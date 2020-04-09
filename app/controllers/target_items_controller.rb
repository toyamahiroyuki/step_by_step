class TargetItemsController < ApplicationController
  def create
    target_item = TargetItem.new(target_item_params)
    target_item.save
    target_item.target_balance = target_item.target.calc_total_cost
    if target_item.save
       redirect_to targets_path
    else
      # @targets = current_user.targets
      # @target_item = TargetItem.new
      # @loans = Loan.where(fixed_cost_id: current_user.fixed_cost.id)
      redirect_to targets_path
    end
    # else
    #       target_item.target_balance = target_item.target_balance - target_item.target_by_month
    #       target_item.save
    #       target_item.target_balance.update(target_item_params)
    # end
  end

  def index
  end

  def edit
    @target_item = TargetItem.find(params[:id])
  end

  def update
    target_item = TargetItem.find(params[:id])
    target = Target.find(target_item.target_id)
    target_item.update(target_item_params)
    target_item.target_balance = target.target_cost - target.target_items.where(id: 1..params[:id].to_i).sum(:target_by_month)
    target_items = target.target_items

    target_items.each do |target_item|
      target_item.target_balance = target.target_cost - target.target_items.where(id: 1..target_item.id).sum(:target_by_month)
      if target_item.update(target_item_params)
    end
        redirect_to targets_path
      else
        @target_item = TargetItem.find(params[:id])
        render aciton: :edit
      end
  end

  def destroy
    target_item = TargetItem.find(params[:id])
    target_add_item = target_item.target_by_month

    target_searchs = TargetItem.where(id: params[:id].to_i + 1..Float::INFINITY)

    target_searchs.each do |target_search|
      target_search.target_balance = target_search.target_balance + target_add_item
      target_search.save!
    end

    # target_searchs.update_all
    target_item.destroy

    # target_item_re = TargetItem.find(params[:id])

    # target_item.target_balance = target_item.target.target_cost - TargetItem.where(target_id: target_item.target.id).sum(:target_by_month)
    # target_item.update(target_item_params)
    # binding.pry
    redirect_to targets_path
  end

  private

  def target_item_params
    params.require(:target_item).permit(:target_id, :target_by_month, :target_balance)
  end
end
