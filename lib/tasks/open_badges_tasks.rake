require 'rake'

desc "Creates a user for accessing the Open Badges admin interface"
task :add_admin, [:email, :password] => :environment do |t, args|
  @user = OpenBadges::User.create(:email => args.email, :password => args.password)
  if @user.valid?
  	puts 'User has been successfully added'
  else
  	puts @user.errors.full_messages
  end
end