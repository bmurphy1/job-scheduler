require 'debugger'
class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(name: params[:job][:name], command: params[:job][:command])
    redirect_to job_path(@job)
  end

  def execute
    @job = Job.find(params[:id])
    if current_user
      result = @job.execute
      JobLog.create(job_id: @job.id, success: result)
      redirect_to jobs_path
    end
  end
end