class JobLogsController < ApplicationController
  def index
    @job_logs = JobLog.all
  end
end