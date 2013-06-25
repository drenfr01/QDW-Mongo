class Vital
  include MongoMapper::EmbeddedDocument
  
  key :bmi, Integer
  key :systolic_bp, Integer
  key :diastolic_bp, Integer
  key :weight, Integer
end
