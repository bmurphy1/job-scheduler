class AddJobLogsToJobs < ActiveRecord::Migration
  def change
    add_column :job_logs, :job_id, :integer
  end
end
