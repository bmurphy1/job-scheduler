require 'resque' # include resque so we can configure it
Resque.redis = "localhost:6379" # tell Resque where redis lives


# This will make the tabs show up.
require 'resque_scheduler'
require 'resque_scheduler/server'