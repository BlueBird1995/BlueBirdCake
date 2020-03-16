class OrdersController < ApplicationController
  def new #注文者情報を入力する
    @order = Order.new
  end

  def confirm #注文確認画面を表示する
  end

  def success #完了画面を表示する（お礼）
  end

  def index #注文履歴一覧を表示する
  end

  def show #注文履歴詳細を表示する
  end

  def create #注文情報を作成する
  end


 private
  　def order_params
    　params.require(:order).permit( :name, :postal_code, :address, :payment,
                                     :total_price, :postage, :status)
    end
end
