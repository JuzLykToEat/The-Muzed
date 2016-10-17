class AddUserIdAndTeacherIdToTimeslot < ActiveRecord::Migration[5.0]
  def change
    add_column :timeslots, :teacher_id, :integer
    add_column :timeslots, :user_id, :integer
  end
end
