class Job < ActiveRecord::Base
  def execute
    system(self.command)
  end
end
