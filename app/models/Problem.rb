class Problem
  include MongoMapper::EmbeddedDocument
  
  key :problem_name, String
  key :icd9, String
  key :date, Date
  key :provider, String
end
