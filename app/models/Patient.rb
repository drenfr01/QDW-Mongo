class Patient
  include MongoMapper::Document
  

  key :full_name, String
  key :pcp, String
  key :dob, Date 
  many :orders
  many :results
  many :problems
  many :vitals  
  many :encounters
  
  belongs_to :site

  attr_accessible :full_name, :dob, :pcp, 
                  :orders, :results, :problems, :vitals
end
