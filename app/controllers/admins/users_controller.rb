class Admins::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admins_user_path(@user)
    else
      render :show
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :first_name, :last_name,
                                  :first_kana, :last_kana,
                                  :email,
                                  :postal_code,
                                  :address,
                                  :telephone_number,
                                  :status )
  end
end
