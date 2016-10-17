class AddDefaultToTimeslot < ActiveRecord::Migration[5.0]
  def change
    change_column :timeslots, :booked, :boolean, default: 0
  end
end
