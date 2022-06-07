class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :datetime
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end
