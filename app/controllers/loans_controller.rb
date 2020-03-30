class LoansController < ApplicationController

  def new
  	@loan = Loan.new
    @loan_item = LoanItem.new
  end

  def index
    @loans = Loan.all
  end

  def create
  	loan = Loan.new(loan_params)
    loan.fixed_cost_id = current_user.fixed_cost.id
    loan.save

    loan_item = LoanItem.new(loan_item_params)

    loan_item.loan_id = loan.id
    loan_item.loan_balance = loan.loan_cost.to_i - loan_item.loan_by_month.to_i
    if loan_item.save

  	   redirect_to targets_path
    else
    end
  end

  def edit
  	@loan = Loan.find(params[:id])
    @loan_items = @loan.loan_items
    # loan_items.each do |loan_item| end
    # binding.pry
  end

  def update
    loan = Loan.find(params[:id])
    loan_items = loan.loan_items
    loan_items.each do |loan_item|

       loan_item.loan_balance = loan.loan_cost - loan_item.loan_by_month
       loan_item.update(loan_item_params)

       end

    if loan.update(loan_params)
  	    redirect_to targets_path
    else
    end

  end

  def destroy
    loan = Loan.find(params[:id])
    loan.destroy

    redirect_to targets_path
  end

private

  def loan_params
    params.require(:loan).permit(:loan_purpose, :loan_cost, :loan_by_month, :loan_balance)
  end

  def loan_item_params
    params.require(:loan_item).permit(:loan_by_month, :loan_balance)
  end
end