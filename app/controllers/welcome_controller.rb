class WelcomeController < ApplicationController
  
  # Render clients page when signed in or welcome page if not signed in.
  def index
    if user_signed_in?
      redirect_to clients_path
    end
  end

  def about
  end
end
