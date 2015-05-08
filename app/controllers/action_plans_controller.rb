class ActionPlansController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @client = current_user.clients.find(params[:client_id])
    @action_plan = @client.action_plans.build
  end
  
  def create
    @client = current_user.clients.find(params[:client_id])
    @action_plan = @client.action_plans.build(action_plan_params)
    if @action_plan.save
      flash[:notice] = "Success!  Plan was saved."
      redirect_to @action_plan
    else
      flash[:error] = "There was an error saving the plan. Please try again."
      render :new
    end
  end

  def show
    @action_plan = ActionPlan.find(params[:id])
    @goals = @action_plan.goals.all
    @client = Client.find(@action_plan[:client_id]) 
  end
  
  def edit
    @action_plan = ActionPlan.find(params[:id])
  end
  
  def update
    @action_plan = ActionPlan.find(params[:id])
    # @client = Client.find(@action_plan[:client_id])

    if @action_plan.update_attributes(action_plan_params)
      flash[:notice] = "Success!  Plan was updated."
      redirect_to @action_plan
    else
      flash[:error] = "There was an error saving the plan. Please try again."
      render :edit
    end
  end


  private
  
  def action_plan_params
    params.require(:action_plan).permit(:description)
  end
end
