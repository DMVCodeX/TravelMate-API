class UpdateUserIdInTripModel < ActiveRecord::Migration[7.0]
  def change
    change_column :trips, :user_id, "integer USING CAST(user_id AS integer)"
  end
end
