class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home

  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
   User.find(session[:user_id]) if logged_in?
 end

 def is_admin?
  @user = User.find(session["user_id"])
  if logged_in? && @user.admin == true
    return true
  else
    return false
  end
 end


  def require_login
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end

  def require_admin
    return redirect_to(controller: 'cities', action: 'index') unless is_admin?
  end
end
