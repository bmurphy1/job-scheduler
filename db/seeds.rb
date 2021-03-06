# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "bmurphy1@mac.com", password: "1234", password_confirmation: "1234")

Job.create(name: "First test job", command: "touch brian.txt")
Job.create(name: "Second test job", command: "touch brian2.txt")

Schedule.create(name: "Every minute", cron_string: "* * * * *")
Schedule.create(name: "Every other minute", cron_string: "*/2 * * * *")
