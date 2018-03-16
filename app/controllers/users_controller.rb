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
    if @user_picks
      @user_picks.each do |stock|
        stock_to_update = Stock.find_by(:symbol => params["stock"])
        stock_to_update.update_attributes(:last => stock["2. price"],
                                          :volume => stock["3. volume"])
    end
  else
      render :show
   end
  end

  def edit 
    @user = User.find(params[:id])
  end 

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] == "Profile Updated"
      redirect_to @user     
    else 
      @errors = @user.errors.full_messages
      render :edit
    end 
  end 

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end