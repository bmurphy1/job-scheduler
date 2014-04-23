class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :cron_string
      t.timestamps
    end
  end
end
