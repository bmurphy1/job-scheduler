require 'debugger'
class ResqueWorker < ActiveRecord::Base
  @queue = :high

  def self.perform(job_options)
    p job_options
    p job_options.class
    # run command, saving success state
    # create JobLog entry from job and success state
    success_result = system(job_options["command"])
    JobLog.create(name: job_options["name"], command: job_options["command"], schedule: job_options["schedule"], success: success_result)
  end
end
