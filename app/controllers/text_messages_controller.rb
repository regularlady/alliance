class TextMessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:receive]
  protect_from_forgery :except => ["receive"]

def new
  @step = Step.find(params[:step_id])
  @text_message = @step.text_messages.build
end

def create
  @step = Step.find(params[:step_id])
  phone = @step.goal.action_plan.client.phone
  content = params[:text_message][:content]
    
  @text_message = @step.text_messages.build(text_message_params)
  @text_message.incoming_message = false
  @text_message.sentstatus = false
  @text_message.phone = phone
  @text_message.client_id = @step.goal.action_plan.client.id 
  
  if @text_message.scheduled_date == nil 
    @text_message.scheduled_date = Date.today
    @text_message.scheduled_time = Time.now.in_time_zone("Pacific Time (US & Canada)")
    @text_message.send_text_message(@text_message.content, @text_message.phone)
  end

  if (@text_message.save && (@text_message.sentstatus == true))
    flash[:notice] = "Success! Text message is being sent now."
    redirect_to @text_message.step.goal.action_plan 
  elsif (@text_message.save && (@text_message.sentstatus == false))
    flash[:notice] = "Success! Text message was scheduled."
    redirect_to @text_message.step.goal.action_plan 
  else
    flash[:error] = "There was an error saving the text message. Please try again."
    render :new
  end
end

def group_new
  @clients = current_user.clients.order(:last_name)
  @text_message = TextMessage.new 
end

def group_create
  client_hash = params[:client_id]

  client_hash.each do |client|
    @client = Client.find(client)
    content = params[:text_message][:content]
    
    @text_message = @client.text_messages.build(text_message_params)
    @text_message.incoming_message = false
    @text_message.sentstatus = false
    @text_message.phone = @client.phone
    @text_message.client_id = @client.id 

    if @text_message.scheduled_date == nil 
      @text_message.scheduled_date = Date.today
      @text_message.scheduled_time = Time.now.in_time_zone("Pacific Time (US & Canada)")
      @text_message.send_text_message(@text_message.content, @text_message.phone)
    else
      @text_message.save 
    end
  end
  redirect_to clients_path
end

def edit
  @text_message = TextMessage.find(params[:id])
  session[:return_to] ||= request.referer
end

def update
  @text_message = TextMessage.find(params[:id])
  
  if @text_message.update_attributes(text_message_params)
      flash[:notice] = "Success! Text was updated."
      redirect_to session.delete(:return_to)
    else
      flash[:error] = "There was an error saving the text. Please try again."
      render :edit
  end
end

def destroy
  @text_message = TextMessage.find(params[:id])
  content = @text_message.content
  session[:return_to] ||= request.referer

  if @text_message.destroy
    flash[:notice] = "\"#{content}\" was deleted successfully."
    redirect_to session.delete(:return_to)
  else
    flash[:error] = "There was an error deleting the text."
  end
end

def receive
  @client = Client.find_by(phone: params[:From])
  @text_message=TextMessage.create!(content: params[:Body], phone: params[:From], incoming_message: "true", sentstatus: "true", client_id: @client.id)
  @text_message.scheduled_date = Date.today
  @text_message.scheduled_time = Time.now.in_time_zone("Pacific Time (US & Canada)")

  if @text_message.save
    @coach_email=CoachEmail.create!(content: @text_message.content, sentstatus: "false", email: @client.user.email,
      coach_firstname: @client.user.first_name, client_firstname: @client.first_name, client_lastname: @client.last_name)
    CoachNotifier.send_coach_email(@coach_email.id).deliver
    render nothing: true, status: 200
  else
    puts 'ERROR: company or customer couldn\'t be loaded' 
  end 
end  

private

def text_message_params
  params.require(:text_message).permit(:content, :scheduled_date, :client_id, :sentstatus, :phone, :scheduled_time)
end  

end