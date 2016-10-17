class AddFullnameToTeacher < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :fullname, :string
  end
end
