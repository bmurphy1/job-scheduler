class Job < ActiveRecord::Base
  has_many :job_logs

  def execute
    system(self.command)
  end
end
