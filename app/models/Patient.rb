class Patient
  include MongoMapper::Document
  

  key :full_name, String
  key :pcp, String
  key :dob, Date 
  many :orders
  many :results
  many :problems
  many :vitals  

  attr_accessible :full_name, :dob
end
