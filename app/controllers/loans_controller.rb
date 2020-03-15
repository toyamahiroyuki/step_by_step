class LoansController < ApplicationController
  def new
  	@loan = Loan.new
  	@communication = Communication.new
  	@tax = Tax.new
  end

  def show
  	@loan = current_user.fixed_cost.loan
  	@communication = current_user.fixed_cost.communication
  	@tax = current_user.fixed_cost.tax
  end

  def create
  	loan = Loan.new(loan_params)
  	communication = Communication.new(communication_params)
  	tax = Tax.new(tax_params)

  	loan.fixed_cost_id = current_user.fixed_cost.id
  	communication.fixed_cost_id = current_user.fixed_cost.id
  	tax.fixed_cost_id = current_user.fixed_cost.id



    if  loan.save
    	communication.save
        tax.save
        redirect_to loans_path
    else

    end
  end

  def edit
  	@loan = current_user.fixed_cost.loan
  	@communication = current_user.fixed_cost.communication
  	@tax = current_user.fixed_cost.tax
  end

  def update
  	loan = current_user.fixed_cost.loan
  	communication = current_user.fixed_cost.communication
  	tax = current_user.fixed_cost.tax

  	if loan.update(loan_params)
       communication.update(communication_params)
       tax.update(tax_params)

    redirect_to loans_path
    else
      render action: :edit
    end
  end

 private
  def loan_params
  	params.require(:loan).permit(:fixed_costs_id, :house, :lesson, :scholarship, :loans_other)
  end

  def communication_params
  	params.require(:communication).permit(:fixed_costs_id,:phone, :wi_fi, :communications_other)
  end

  def tax_params
  	params.require(:tax).permit(:fixed_costs_id, :health, :pension, :resident, :taxes_other)
  end
end
