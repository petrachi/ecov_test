class AddIndexToTrips < ActiveRecord::Migration[5.2]
  def change
    add_index :trips, :token, unique: true
  end
end
