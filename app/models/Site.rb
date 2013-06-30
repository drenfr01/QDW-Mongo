class Site
  include MongoMapper::Document

  key :name, String
  key :size_in_patients, Integer
  many :locations
  many :providers  

end
  
