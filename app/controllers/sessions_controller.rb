class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end


##REMEMBER ME CLEANUP
##fix styling and form if needed
##migrate to heroku and re-try


##BCRYPT PSEDUO FOR REMEMBER ME 
# Create a random string of digits for use as a remember token.
# Place the token in the browser cookies with an expiration date far in the future.
# Save the hash digest of the token to the database.
# Place an encrypted version of the user’s id in the browser cookies.
# When presented with a cookie containing a persistent user id, find the user in the database using the given id, and verify that the remember token cookie matches the associated hash digest from the database.