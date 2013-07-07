# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bob = Patient.create({
  :full_name => "Bob",
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

steve = Patient.create({
        :full_name => "Steve",
        :pcp => "Dr. Kelso",
        :dob => Date.new(1985,3,5),
        :orders => [
          Order.new(:order_type => "Physical Exam", :date => Date.new(2011,5,3),
                    :provider => "Dr. Cox")],
        :results => [ 
          Result.new(:result_type => "LDL", :quantity => "90", :date => "2013-01-03"          , :provider => "Dr. Turk")]
})
steve.save

fred = Patient.create({
  :full_name => "Steve",
  :pcp => "Dr. Smith",
  :dob => Date.new(1986,1,19),
  :orders => [
    Order.new(:order_type => "PAP", :date => Date.new(2012,10,10),
            :provider => "Dr. Worthy")],
  :results => [
    Result.new(:result_type => "A1C", :quantity => 9, :date => "2013-03-01",                :provider => "Dr. Kelso")
  ]
})
fred.save  

#Format is to have Patient.create.save, and pull bunch of random variables
#TODO: Move this seed data to bunch of csv files
full_names = ['Mark', 'Mary', 'John', 'Joe', 'Dave', 'Cole', 'Cindy', 'Emily', 'Allison']

providers = ['Dr. Kelso', 'Dr. Smith', 'Dr. Worthy', 'Dr. Cox', 'Dr. Turk', 'Dr. Reed', 'Dr. Dorian']

order_types = ['Physical Exam', 'Colonoscopy', 'Flu Shot', 'Mental Health Counseling', 'Specialist']

result_types = ['A1C', 'LDL', 'HDL', 'Triglycerides']

a1c_range = {"lower" => 5, "upper" => 15}
ldl_range = {"lower" => 80, "upper" => 200}
hdl_range = {"lower" => 20, "upper" => 100}
tri_range = {"lower" => 150, "upper" => 300}

(0..100).each do |i|
  patient = Patient.create()
  full_name_number = rand(full_names.length)
  patient.full_name = full_names(full_name_number)  
  puts patient
end
