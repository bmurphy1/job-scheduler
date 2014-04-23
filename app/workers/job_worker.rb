class JobWorker
  include Sidekiq::Worker

  def perform(job_command, count)
    system(job_command)
  end
end