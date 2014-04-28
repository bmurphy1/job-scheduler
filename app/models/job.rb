require 'debugger'
class Job < ActiveRecord::Base
  has_many :job_logs
  belongs_to :schedule

  validates :name, uniqueness: true
  validates :name, :command, presence: true

  before_destroy { Resque.remove_schedule(self.name) }

  after_save do
    if self.schedule
      self.execute
    end
  end

  def execute
    p "EXECUTE IS GETTING RUN"
    # Resque.remove_schedule(self.name)
    # JobLog.create(job_id: self.id)
    config = {}
    config[:class] = 'ResqueWorker'
    config[:args] = self.command
    config[:cron] = self.schedule.cron_string
    config[:queue] = 'high'
    config[:persist] = true
    Resque.set_schedule(self.name, config)
  end
end
