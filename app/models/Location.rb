class Location 
  include MongoMapper::Document

  key :name, String
  key :address, String
  many :providers
  
  belongs_to :site
end
