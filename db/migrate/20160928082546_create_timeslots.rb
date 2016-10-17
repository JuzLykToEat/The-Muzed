class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.time :time
      t.boolean :booked

      t.timestamps
    end
  end
end
