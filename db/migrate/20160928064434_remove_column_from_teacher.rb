class RemoveColumnFromTeacher < ActiveRecord::Migration[5.0]
  def change
    remove_column :teachers, :levels_taught
    remove_column :teachers, :hourly_rate
  end
end
