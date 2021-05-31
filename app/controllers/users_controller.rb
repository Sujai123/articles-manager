class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.all.paginate(page: params[:page], per_page: 5)
  end

  def update
    if(@user.update(user_params))
      flash[:notice] = "Account updated successfully"
      redirect_to @user  
    else
      render "edit"
    end
  end

  def create
    @user = User.new(user_params)
    if(@user.save)
      flash[:notice] = "Account created successfully"
      session[:user_id] = @user.id
      redirect_to @user  
    else
      render "new"
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User along with articles deleted Successfully"
    session[:user_id] = nil
    redirect_to articles_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if (!is_current_user?(@user))
      flash[:error] = "You can only edit your own account"
      redirect_to @user
    end
  end

end