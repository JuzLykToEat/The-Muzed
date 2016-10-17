class ChangeDataTypeForLessonLocations < ActiveRecord::Migration[5.0]
  def change
  	change_column :teachers, :lesson_locations, :string
  end
end
