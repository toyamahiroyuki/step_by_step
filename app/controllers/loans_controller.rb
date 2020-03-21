class LoansController < ApplicationController

  def new
  	@loan = Loan.new
  end

  def create
  	loan = Loan.new(loan_params)
    loan.fixed_cost_id = current_user.fixed_cost.id
    loan.loan_balance = loan.loan_cost - loan.loan_by_month

    if loan.save

  	   redirect_to targets_path
    else
    end
  end

  def edit
  	@loan = Loan.find(params[:id])
  end

  def update
    loan = Loan.find(params[:id])
    loan.loan_balance = loan.loan_cost - loan.loan_by_month

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
end