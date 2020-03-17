class ChangeStatusDefaultOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :status, from: "ture", to: true
  end
end
