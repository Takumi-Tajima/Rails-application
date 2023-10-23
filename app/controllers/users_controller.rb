class UsersController < ApplicationController
  def show
    # @user = User.first
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #Success
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # redirect_to user_path(@user)
    else
      #Failuer
      render 'new', status: :unprocessable_entity
    end
  end

  private
    # Strong Parameters
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
