class GoalsController < ApplicationController
  def new
  	@goal = Goal.new
  end

  def index
  	@goals = Goal.all
  end

  def edit
  end
end
