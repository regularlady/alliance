class GoalsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @action_plan = ActionPlan.find(params[:action_plan_id])
    @goal = @action_plan.goals.build
    @goals = @action_plan.goals.all
    @client = Client.find(@action_plan[:client_id]) #awkward, but works.
  end

  def create
    @action_plan = ActionPlan.find(params[:action_plan_id])
    @goal = @action_plan.goals.build(goal_params)
    if @goal.save
      flash[:notice] = "Success!  Goal was saved."
      redirect_to @action_plan
    else
      flash[:error] = "There was an error saving the goal. Please try again."
      render :new
    end
  end

  def show
    @action_plan = ActionPlan.find(params[:action_plan_id])
    @goals = @action_plan.goals.all
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @action_plan = ActionPlan.find(@goal.action_plan_id)
    # @client = Client.find(@action_plan[:client_id])

    if @goal.update_attributes(goal_params)
      flash[:notice] = "Success!  Goal was updated."
      redirect_to @action_plan
    else  
      flash[:error] = "There was an error saving the goal. Please try again."
      render :edit
    end
  end


  private
  
  def goal_params
    params.require(:goal).permit(:description)
  end
end
