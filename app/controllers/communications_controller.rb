class CommunicationsController < ApplicationController
  def new
  	@communication = Communication.new
  	@tax = Tax.new
  end

  def show
  	@communication = current_user.fixed_cost.communication
  	@tax = current_user.fixed_cost.tax
  end

  def create
  	communication = Communication.new(communication_params)
  	tax = Tax.new(tax_params)

  	communication.fixed_cost_id = current_user.fixed_cost.id
  	tax.fixed_cost_id = current_user.fixed_cost.id



    if  communication.save
        tax.save
        redirect_to communication_path
    else

    end
  end

  def edit
  	@communication = current_user.fixed_cost.communication
  	@tax = current_user.fixed_cost.tax
  end

  def update
  	communication = current_user.fixed_cost.communication
  	tax = current_user.fixed_cost.tax

      if communication.update(communication_params)
         tax.update(tax_params)

    redirect_to communication_path
    else
      render action: :edit
    end
  end

 private

  def communication_params
  	params.require(:communication).permit(:fixed_costs_id,:phone, :wi_fi, :communications_other)
  end

  def tax_params
  	params.require(:tax).permit(:fixed_costs_id, :health, :pension, :resident, :taxes_other)
  end
end
