# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bob = Patient.create({
  :full_name => "duncan",
  :pcp => "Dr. Smith",
  :dob => Date.new(1989,2,10),
  :orders => [
    Order.new(:order_type => "PAP", :date => Date.new(2010,10,10),
            :provider => "Dr. Worthy")],
  :results => [
    Result.new(:result_type => "A1C", :quantity => 7, :date => "2012-01-01",                :provider => "Dr. Kelso")
  ]
})
bob.save  
