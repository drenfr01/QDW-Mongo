// Only actually need a measure for each reduction, all are the same
// Basically each metric will have all criteria reading document, and then the 
// measure (which should be generic) will merely sum them all up. 
// The finalizer decides what kind of statistics we apply, whether it's
// a percentage, median, etc.

//Map reduce function takes in logic to reduce documents that it looks at

//debug map function
var emit = function(key,value) {
  print("emit");
  print("key" + key + " value: " + tojson(value));
}

//Metrics
//TODO: Aggregate Metrics are tricky
//TODO: Package more information into the metric
var ResultsMetric = function() {
  var flag = 0;
  this.results.forEach(function(result) {
    if (result.quantity <= threshold) {
      flag = 1;
    }   
  })
  emit(this.pcp,flag);
}

var OrdersMetric = function() {
  var flag = 0;
  var periodEnd = new Date(2011,0,1);
  this.orders.forEach(function(order) {
    if (order.date >= periodEnd) {
      flag = 1;
    }   
  })
  emit(this.pcp,flag);
}


//Measures
//TODO: Reducers are not called on Single Document result sets
var StandardMeasure = function(keyProvider, metricFlags) { 
  reducedVal = {count: 0, sum: 0}; 
  for(i = 0; i < metricFlags.length; i++)  { 
    reducedVal.count += 1; reducedVal.sum += metricFlags[i]; 
  } 
  return reducedVal; 
}


//Finalizers
var PercentageFinalizer = function(key, reducedVal) { 
  return reducedVal.sum / reducedVal.count 
}


//Map Reduce Call 
var A1C = function() {
  db.patients.mapReduce(
    ResultsMetric, 
    StandardMeasure, 
    { out: { merge: "map_reduce_example"}, 
      query: {"results.result_type": "A1C"},
      finalize: PercentageFinalizer,
      scope: { threshold: 7 }
    } 
  )
}

var PhysicalExam = function() {
  db.patients.mapReduce(
    ResultsMetric, 
    StandardMeasure, 
    { out: { merge: "map_reduce_example"}, 
      query: {"orders.order_type": "Physical Exam"},
      finalize: PercentageFinalizer,
      scope: { threshold: 1 }
    } 
  )
}
