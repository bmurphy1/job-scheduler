class CreateJobLogs < ActiveRecord::Migration
  def change
    create_table :job_logs do |t|
      t.belongs_to :job
      t.belongs_to :user
      t.belongs_to :schedule
      t.boolean :success
      t.timestamps
    end
  end
end
