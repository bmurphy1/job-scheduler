class JobWorker
  # include Sidekiq::Worker

  def self.perform(job_command)
    system(job_command)
  end
end