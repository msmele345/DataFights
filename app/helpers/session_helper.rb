module SessionHelper

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(:id => user_id)
      if user && user.authenticated?(cookies[:remember_token])
        session[:user_id] = user.id
        @current_user = user
      end 
    end 
  end

  def logged_in?
    session[:user_id] != nil
  end

  def redirect_unless_logged_in
    redirect_to new_session_path unless logged_in?
  end

  def redirect_unless_owner(user)
    redirect_to root_path unless current_user == user
  end

  def authorized?(user)
    current_user == user
  end

  def remember(user)
    user.remember 
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end 

  ##forgets a persistant session 
  def forget(user)
    user.forget 
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end 

  ##logs out current user 
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end 

end