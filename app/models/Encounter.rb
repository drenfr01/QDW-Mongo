class Encounter
  include MongoMapper::EmbeddedDocument

  key :date, Date
  key :provider, String
  key :medical_ind, Boolean
  
  belongs_to :patient
