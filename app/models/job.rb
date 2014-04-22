class Job < ActiveRecord::Base
  has_many :job_logs
  validates :name, uniqueness: true

  def execute
    system(self.command)
  end
end
