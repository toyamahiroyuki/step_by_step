class UsersController < ApplicationController
    before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
       redirect_to user_path(current_user)
    else
       @user = User.find(params[:id])
       render action: :edit
    end
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to homes_top_path
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :old, :sex, :job, :deposit, :member, :email)
  end
end
