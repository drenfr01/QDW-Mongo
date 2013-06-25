class User
  include MongoMapper::Document

  key :name, String
  key :email, String
  key :admin, Boolean
  
  attr_accessible :name, :email
end
