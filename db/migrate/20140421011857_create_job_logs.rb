class CreateJobLogs < ActiveRecord::Migration
  def change
    create_table :job_logs do |t|
      t.string :name
      t.string :command
      t.string :schedule
      t.boolean :success
      t.timestamps
    end
  end
end
