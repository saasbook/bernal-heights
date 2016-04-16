# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Resource.create(title: "SJHHS", description: "school", link: "www.sjhhs.com", phone: "(949) 111-1111")
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email