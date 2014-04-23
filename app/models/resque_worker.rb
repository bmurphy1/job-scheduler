class ResqueWorker < ActiveRecord::Base
  @queue = :high

  def self.perform(job_command)
    system(job_command)
  end
end
