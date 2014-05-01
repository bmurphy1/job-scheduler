#Job Scheduler

This is a Rails app designed for a SysAdmin and allows them to schedule and run shell commands on the machine this web app runs from. Basically it’s a cron web app, without cron. It uses the resque and resque-scheduler gems to do this, and meets the following requirements:

- Store jobs in MySQL database
- Run things that you might run at a rails console or command line interface (ubuntu)
- Create, update, and delete jobs and schedules
- Run w/ repetition on a set of days or times (see how cron works, example: run some piece of code every hour at the 15 - - minute mark on tuesdays)
- See a visual display of which scheduled jobs currently exist
- See a visual display of historical jobs and ideally some output of whether they succeeded or failed


**Warning:** This web app is *incredibly* insecure. It allows the running of arbitrary shell commands by a user of this web app, with no validation of those commands. The intended user would be a SysAdmin who knows what they are doing, but for some reason doesn't want to use cron. Please use at your own risk.

##Requirements
Rails, Redis, MySQL

##Installation
Fork the repo, then the usual Rails setup:
```ruby
bundle install
```
Then setup the database:
```ruby
rake db:create, db:migrate, db:seed
```

##To Start
Make sure you're running Redis before starting the Resque worker or scheduler. Here's a good order to run the following commands.Run each command in a separate shell:
```
$ redis-server
```
```
$ rails server
```
```
$ QUEUE=* rake resque:work
```
```
$ DYNAMIC=true rake resque:scheduler
```


##Ideas/To Do/Icebox
- Drop down menus for the user to more easily define schedules. Likely use JavaScript to convert entries from these meuns etc to a cron string to be passed to the schedule model.
- Schedule a job to run at a certain time, but only once.
- Ability to see history of all times a single job has run

##License
Provided as is.
