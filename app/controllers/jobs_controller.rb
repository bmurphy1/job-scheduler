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

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(name: params[:job][:name], command: params[:job][:command])
    redirect_to job_path(@job)
  end

  def update
    p params
    @job = Job.find(params[:id])
    if params[:job]["schedule_id"] == ""
      @schedule = nil
    else
      @schedule = Schedule.find(params[:job]["schedule_id"])
    end
      @job.update(name: params[:job][:name],
        command: params[:job][:command],
        schedule: @schedule)
    redirect_to job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  # def execute
  #   @job = Job.find(params[:id])
  #   if current_user
  #     config = {}
  #     config[:class] = 'ResqueWorker'
  #     config[:args] = @job.command
  #     config[:cron] = @job.schedule.cron_string
  #     config[:queue] = 'high'
  #     config[:persist] = true
  #     p config
  #     Resque.set_schedule(@job.name, config)
  #     redirect_to jobs_path
  #   end
  # end
end