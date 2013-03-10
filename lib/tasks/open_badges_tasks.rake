# desc "Explaining what the task does"
# task :open_badges do
#   # Task goes here
# end


desc "Test task"
task :admin => :environment do
  puts OpenBadges::Organization.all.inspect
end