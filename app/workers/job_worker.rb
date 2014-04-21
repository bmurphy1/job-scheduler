class JobWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts "doing hard work"
  end
end