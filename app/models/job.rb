require 'debugger'
class Job < ActiveRecord::Base
  belongs_to :schedule
  has_many :joblogs

  validates :name, uniqueness: true
  validates :name, :command, presence: true

  after_save { self.schedule ? self.execute : Resque.remove_schedule(self.name) }
  before_destroy { Resque.remove_schedule(self.name) }

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
