# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = CreateAdminService.new.call(ENV['ADMIN_EMAIL'], ENV['ADMIN_PASSWORD'], ENV['ADMIN_NAME'])
if admin
  puts 'CREATED ADMIN USER: ' << admin.name
end

observer = CreateAdminService.new.call(ENV['OBSERVER_EMAIL'], ENV['OBSERVER_PASSWORD'], ENV['OBSERVER_NAME'])
if observer
  puts 'CREATED OBSERVER ACCT ' << observer.name
end

bh_admin = CreateAdminService.new.call(ENV['BH_EMAIL'], ENV['BH_PASSWORD'], ENV['BH_NAME'])
if bh_admin
  puts 'CREATED BHNC ACCT ' << bh_admin.name
end