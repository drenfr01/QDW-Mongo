class Result
  include MongoMapper::EmbeddedDocument
  
  key :result_type, String
  key :quantity, Integer
  key :units, String
  key :date, Date
  key :provider, String
end
