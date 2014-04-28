class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(name: params[:schedule][:name], cron_string: params[:schedule][:cron_string])
    redirect_to schedule_path(@schedule)
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(name: params[:schedule][:name], cron_string: params[:schedule][:cron_string])
    redirect_to schedule_path(@schedule)
  end

end