class UsersController < ApplicationController
  before_action :correct_user
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "会員情報を更新しました"
    else
      render :edit
    end
  end

  #削除確認ページ
  def confirm_destroy
    @user = User.find(params[:id])
  end


  def hide
    @user = User.find(params[:id])
    #真偽値反転
    @user.toggle!(:status)
    #セッション情報削除
    reset_session
    flash[:notice] = "退会完了しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit( :first_name, :last_name,
                                  :first_kana, :last_kana,
                                  :email,
                                  :postal_code,
                                  :address,
                                  :telephone_number,
                                  :status )
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end
end
