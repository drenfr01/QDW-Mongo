require "../ruby_scripts/create_random_data.rb"

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
