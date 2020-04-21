class IncomesController < ApplicationController
  before_action :authenticate_user!
  def new
    @income = Income.new
    @income_day = params["day"]

    # partial = render_to_string(partial: 'new', layout: false, collection: @income)
    # puts partial
    # render json: { html: partial }

    # render plain: render_to_string(partial: 'new', layout: false, locals: { income: @income})
  end

  def show
    user = User.find(params[:id])
    # if user.id == current_user.id
    #   @incomes0 = current_user.incomes.where(income_item: "給料", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    #   @incomes1 = current_user.incomes.where(income_item: "手当て", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    #   @incomes2 = current_user.incomes.where(income_item: "退職金", created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    #   @incomes3 = current_user.incomes.where(income_item: "その他",created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    #                                                             # @income.created_at.beginning_of_month..Time.now.end_of_month).sum(:income)
    #   @imcomes = current_user.incomes.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    #  else
    @incomes_salary = user.incomes.where(income_item: "給料", day: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    @incomes_help = user.incomes.where(income_item: "手当て", day: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    @incomes_retirement = user.incomes.where(income_item: "退職金", day: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    @incomes_other = user.incomes.where(income_item: "その他", day: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)
    # @income.created_at.beginning_of_month..Time.now.end_of_month).sum(:income)
    @incomes = user.incomes.where(day: Time.now.beginning_of_month..Time.now.end_of_month)
    @total_incomes = user.incomes.where(day: Time.now.beginning_of_month..Time.now.end_of_month).sum(:income)

    # end
  end

  def create
    @income = Income.new(income_params)
    @income.user_id = current_user.id
    if @income.save
      redirect_to homes_top_path
    else
      @income = Income.new
      @income_day = params["day"]
      @incomes = current_user.incomes.where(day: @income_day)
      render action: :new
    end
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    income = Income.find(params[:id])
    if income.update(income_params)
      redirect_to income_path(current_user)
    else
      # @income_day = params["day"]
      @income = Income.find(params[:id])
      render action: :edit
    end
  end

  def destroy
    income = Income.find(params[:id])
    income.destroy

    redirect_to income_path(current_user)
  end

  private

  def income_params
    params.require(:income).permit(:day, :income, :income_item, :income_memo)
  end
end
