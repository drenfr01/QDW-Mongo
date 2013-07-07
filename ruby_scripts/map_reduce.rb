#Setup
require 'mongo'

include Mongo

mongo_client = MongoClient.new("localhost",27017) 
db = mongo_client.db("#myapp-development")
patients_coll = db.collection("patients")

# Only actually need a measure for each reduction, all are the same
# Basically each metric will have all criteria reading document, and then the 
# measure (which should be generic) will merely sum them all up. 
# The finalizer decides what kind of statistics we apply, whether it's
# a percentage, median, etc.

#Map reduce function takes in logic to reduce documents that it looks at

#Metrics
#TODO: Aggregate Metrics are tricky
#TODO: Package more information into the metric
resultsMetric = "function() { " +
  "var flag = 0; " +
  "this.results.forEach(function(result) { " +
    "if (result.quantity <= threshold) { " +
       " flag = 1; " +
     "}; " +
  "}); " +
  "emit(this.pcp,flag); " +
"}"
map    = "function() { emit(this.author, {votes: this.votes}); }"

#Measures
#TODO: Reducers are not called on Single Document result sets
standardReduce = "function(keyProvider, metricFlags) { " +
  "var reducedVal = {count: 0, sum: 0}; " +
  "for(i = 0; i < metricFlags.length; i++)  { " +
    "reducedVal.count += 1; reducedVal.sum += metricFlags[i]; " +
  "} " +
  "return reducedVal; " +
"}"

reduce = "function(key, values) { " +
  "var sum = 0; " +
  "values.forEach(function(doc) { " +
  " sum += doc.votes; " +
  "}); " +
  "return {votes: sum}; " +
"};"

#Finalizers
percentageFinalizer = "function(key, reducedVal) { " +
  "return reducedVal.sum / reducedVal.count " +
"}"


#Map Reduce Call 
@results = patients_coll.map_reduce(resultsMetric, standardReduce,
             :out => "map_reduce_example",
             :query => {"results.result_type" => "A1C"},
             :finalize => percentageFinalizer,
             :scope => {"threshold" => 8}
            )
puts "Results..."
puts @results.find().to_a
