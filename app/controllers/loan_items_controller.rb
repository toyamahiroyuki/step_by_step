class LoanItemsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def edit
    @loan_item = LoanItem.find(params[:loan_id])
  end

  def update
    loan_item = LoanItem.find(params[:loan_id])
    if loan_item.update(loan_item_params)

      redirect_to targets_path
    else
      @loan_item = LoanItem.find(params[:loan_id])
      render action: :edit
    end
  end

  def destroy
    loan_item = LoanItem.find(params[:loan_id])
    loan_item.destroy

    redirect_to targets_path
  end

  private

  def loan_item_params
    params.require(:loan_item).permit(:loan_by_month)
  end
end
