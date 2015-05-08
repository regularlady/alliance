class StepsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @goal = Goal.find(params[:goal_id])
    @step = @goal.steps.build
    @action_plan = ActionPlan.find(@goal.action_plan_id)
    @client = Client.find(@action_plan[:client_id]) #awkward, but works.
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @action_plan = ActionPlan.find(@goal.action_plan_id)
    @step = @goal.steps.build(step_params)

    if @step.save
      flash[:notice] = "Success!  Step was saved."
      redirect_to @action_plan
    else
      flash[:error] = "There was an error saving the step. Please try again."
      render :new
    end
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    @goal = Goal.find(@step.goal_id)
    @action_plan = ActionPlan.find(@goal.action_plan_id)
    @client = Client.find(@action_plan[:client_id])

    if @step.update_attributes(step_params)
      flash[:notice] = "Success!  Step was updated."
      redirect_to @action_plan
    else
      flash[:error] = "There was an error saving the step. Please try again."
      render :edit
    end
  end


  private
  
  def step_params
    params.require(:step).permit(:description, :due_by, :complete)
  end
end
