class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.date :date
      t.integer :sunset_in_seconds
      t.references :location
      t.boolean :cached, :default => false
      t.timestamps
    end
  end
end
