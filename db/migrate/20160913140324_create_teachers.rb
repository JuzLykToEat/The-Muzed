class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :subject
      t.string :education
      t.string :biography
      t.string :teaching_statement
      t.string :address
      t.string :ages_taught
      t.string :levels_taught
      t.string :languages
      t.boolean :lesson_locations
      t.integer :hourly_rate
      t.boolean :teach_special_needs
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
