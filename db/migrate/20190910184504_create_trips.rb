class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :token
      t.string :aasm_state

      t.timestamps
    end
  end
end
