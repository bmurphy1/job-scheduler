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
    job_options_hash = {
      :name => self.name,
      :command => self.command,
      :schedule => self.schedule.name
    }

    config = {
      :class => 'ResqueWorker',
      :args => job_options_hash,
      :cron => self.schedule.cron_string,
      :queue => 'high',
      :persist => true
    }

    Resque.set_schedule(self.name, config)
  end
end
