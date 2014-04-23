class ResqueWorker < ActiveRecord::Base
  @queue = :scheduled_queue

  def self.perform(job_command)
    system(job_command)
  end
end
