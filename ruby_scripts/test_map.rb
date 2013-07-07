#Setup
require 'mongo'

include Mongo

mongo_client = MongoClient.new("localhost",27017) 
db = mongo_client.db("#myapp-development")
patients_coll = db.collection("patients")

map = "function() { emit(this.pcp, 1); }"
reduce = "function(key, values) { " +
  "var sum = 0; " +
  "values.forEach(function(doc) { " +
  " sum += doc.votes; " +
  "}); " +
  "return {votes: sum}; " +
"}"

@results = patients_coll.map_reduce(map, reduce, :out => "mr_results")

