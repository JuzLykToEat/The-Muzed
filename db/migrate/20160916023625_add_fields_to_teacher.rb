class AddFieldsToTeacher < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :latitude, :float
    add_column :teachers, :longitude, :float
  end
end
