class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :number
      t.string :car_model_name
      t.integer :user_id
      t.timestamps
    end
  end
end
