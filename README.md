***Job Scheduler

This is a Rails app designed for a SysAdmin and allows them to schedule and run shell commands. Basically it’s a cron web app, without using cron. It meets the following requirements:

Warning: this is an incredibly insecure implementation. It allows a user of this web app to run arbitrary shell commands from the web app.

**Requirements
Rails
Redis
MySQL

The following gems are used

**Installation:
The usual Rails setup.
bundle install
Then setup the database:
rake db:create, db:migrate, db:seed


**To Start:
redis-server
rails server
QUEUE=* rake resque:work
DYNAMIC=true rake resque:scheduler

***License
Provided as is.
