class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :teacher, foreign_key: true
      t.datetime :day
      t.datetime :time
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
