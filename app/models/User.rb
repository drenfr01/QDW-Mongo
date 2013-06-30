class User
  include MongoMapper::Document
  safe

  many :posts
  key :username, String
  timestamps! 
end
