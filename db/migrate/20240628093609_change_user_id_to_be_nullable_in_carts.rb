class ChangeUserIdToBeNullableInCarts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :carts, :user_id, true
  end
end
