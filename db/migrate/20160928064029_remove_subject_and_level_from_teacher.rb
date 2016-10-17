class RemoveSubjectAndLevelFromTeacher < ActiveRecord::Migration[5.0]
  def change
    remove_column :teachers, :subject, :levels_taught
  end
end
