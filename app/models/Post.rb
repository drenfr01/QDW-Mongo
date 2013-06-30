class Post
  include MongoMapper::Document
  safe
    
  belongs_to :user

  key :content, String
  key :tags, Array
  timestamps!
end
