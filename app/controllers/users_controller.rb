class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the StockFights!"
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end


##find by or create
##update attributes
##iterate through user picks and update information with update attributes
  def show
    @user = User.find_by(:id => params[:id])
    add_single_stock(params["stock"])
    @user_picks = user_list(params["stock"])
    p @user_picks[0]["2. price"]
    render :show
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end


end