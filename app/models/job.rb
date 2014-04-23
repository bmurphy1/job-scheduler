class Job < ActiveRecord::Base
  has_many :job_logs
  belongs_to :schedule

  validates :name, uniqueness: true
  validates :name, :command, presence: true

  def execute
    system(self.command)
  end
end
