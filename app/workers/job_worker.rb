class JobWorker
  include Sidekiq::Worker

  def perform(job_command)
    system(job_command)
  end
end