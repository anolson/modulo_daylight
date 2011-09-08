class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.date :date
      t.datetime :sunset_at
      t.references :location
      t.timestamps
    end
  end
end
