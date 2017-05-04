class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!   
    if current_user.nil?
      redirect_to new_user_path, alert: "Not authorized" 
    else
      refresh_online
    end
  end

  def refresh_online 
    ActionCable.server.broadcast "userloggedin", { user_id: current_user.id, status: true }
  end

end
