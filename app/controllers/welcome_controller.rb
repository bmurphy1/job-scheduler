class WelcomeController < ApplicationController
  def index
    @scheduled_jobs = Job.select {|j| j.schedule }
  end
end