class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def show  
    @articles = @user.articles.paginate(page: params[:page], per_page: 3)  # display articles according to the user
  end

  def index 
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def edit 
    #byebug  
  end

  def update 
  
      if @user.update(user_params) 
       flash[:notice] = "Your account information was successfully updated"
       redirect_to @user 
      else
         render 'edit'
      end
  end

  def create 
    @user = User.new(user_params)
     if @user.save
      session[:user_id] = @user.id # create user session
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully sign up"
      redirect_to users_path
     else
      render 'new'
     end
  end


  private

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
 
  def set_user 
    @user = User.find(params[:id])
  end

  def require_same_user 
    if current_user != @user 
      flash[:alert] = "You can onlu edit your own account"
      redirect_to @user
    end
  end
  
end