# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['admin', 'cashier'].each do |role|
  Role.find_or_create_by({name: role})
end

['Food', 'Drink'].each do |role|
  Category.find_or_create_by({name: role})
end

  User.create({:email => "adm@adm.com", :password => "a1s2d3f4", :password_confirmation => "a1s2d3f4", :role => Role.find_by_name('admin')})
  User.create({:email => "cashier@test.com", :password => "a1s2d3f4", :password_confirmation => "a1s2d3f4", :role => Role.find_by_name('cashier')})
