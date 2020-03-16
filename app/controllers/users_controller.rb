class UsersController < ApplicationController
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

  def confirm_destroy
    @user = User.find(params[:id])
  end


  def hide
    @user = User.find(params[:id])
    #userのstatusを反転させてる
    @user.toggle!(:status)
    #この行でセッション削除してログアウトさせたい
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
                                  :telephone_number )
  end
end
