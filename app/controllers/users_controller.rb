class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "You have successfully sign_up"
    else
      render :new, notice: "failed to sign_up"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
  params.require(:user).permit(:firstname, :lastname, :email, :password,
                                     :password_confirmation)
  end
end