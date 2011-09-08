class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :state
      t.string :city
      t.string :timezone
      t.timestamps
    end
  end
end
