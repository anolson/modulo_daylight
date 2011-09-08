class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :term
      t.references :location
      t.timestamps
    end
  end
end
