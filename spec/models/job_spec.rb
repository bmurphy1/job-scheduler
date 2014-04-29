require 'spec_helper'

describe Job do
  before :each do
    @job = Job.create(name: "Test job", command: "touch test.txt")
    @schedule = Schedule.create(name: "Every day at noon", cron_string: "0 12 * * *")
  end

  after :each do
    Resque.remove_schedule(@job.name)
    @job.destroy
    @schedule.destroy
  end

  it "Gets scheduled when associated with a schedule" do
    @job.update(schedule: @schedule)
    expect(Resque.schedule[@job.name]).to be_true
  end

  xit "Gets unscheduled when unassociated with a schedule" do
    @job.update(schedule: @schedule)
    @job.update(schedule: nil)
    expect(Resque.schedule[@job.name]).to be_nil
  end
end
