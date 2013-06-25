class Order
  include MongoMapper::EmbeddedDocument
    
    key :order_type, String
    key :date, Date
    key :provider, String
end
