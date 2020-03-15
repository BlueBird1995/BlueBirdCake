class DeliveriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user_id = params[:user_id]
    # あとでcurrent_user.idにする
    @delivery = @delivery.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_back(fallback_location: root_path)
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to user_deliveries_path
  end

end

private
def delivery_params
    params.require(:delivery).permit(:postal_code, 
                                       :address, 
                                       :name)
end