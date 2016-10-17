class AddIdToScheduleAndTimeslot < ActiveRecord::Migration[5.0]
  def change
    add_column :timeslots, :schedule_id, :integer
    add_column :schedules, :subject_id, :integer
  end
end
