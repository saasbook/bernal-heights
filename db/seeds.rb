# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << admin.email

observer = Admin.find_or_create_by!(email: "dluu@berkeley.edu") do |observer|
  observer.name = "Dorthy Luu"
  observer.password = "12345678"
  observer.password_confirmation = "12345678"
  observer.admin = true
end
if observer
  puts 'CREATED OBSERVER ACCT ' << observer.name
end

Hotspot.destroy_all