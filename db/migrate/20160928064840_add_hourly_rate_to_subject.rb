class AddHourlyRateToSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :hourly_rate, :integer
  end
end
