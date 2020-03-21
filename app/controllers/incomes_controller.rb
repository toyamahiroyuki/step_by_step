class IncomesController < ApplicationController
  def new
   @income = Income.new
   @income_day = params["day"]
   # @proportial_day = params["day"]
  end

  def index
   @incomes0 = Income.where(income_item: "給料", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
   @incomes1 = Income.where(income_item: "手当て", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
   @incomes2 = Income.where(income_item: "退職金", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
   @incomes3 = Income.where(income_item: "その他",created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
                                                             # @income.created_at.beginning_of_month..Time.now.end_of_month).sum(:income)
  end

  def create
   @income = Income.new(income_params)
   @income.user_id = current_user.id
   if @income.save
   	redirect_to homes_top_path
   else
   end
  end

private
 def income_params
   params.require(:income).permit(:day, :income, :income_item, :income_memo)
 end

end
