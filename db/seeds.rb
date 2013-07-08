full_names = ['Mark', 'Mary', 'John', 'Joe', 'Dave', 'Cole', 'Cindy', 'Emily',
 'Allison']

providers = ['Dr. Kelso', 'Dr. Smith', 'Dr. Worthy', 'Dr. Cox', 'Dr. Turk',
 'Dr. Reed', 'Dr. Dorian']

order_types = ['Physical Exam', 'Colonoscopy', 'Flu Shot', 
'Mental Health Counseling', 'Specialist']

result_types = [:a1c, :ldl, :hdl, :tri]

a1c_range = {"lower" => 5, "upper" => 15}
ldl_range = {"lower" => 80, "upper" => 200}
hdl_range = {"lower" => 20, "upper" => 100}
tri_range = {"lower" => 150, "upper" => 300}

ranges = {:a1c => {:lower => 5, :upper => 15},
          :ldl => {:lower => 80, :upper => 200},
          :hdl => {:lower => 20, :upper => 100},
          :tri => {:lower => 150, :upper => 300}
        } 

number_of_patients = 100
number_of_orders = rand(10) 
number_of_results = rand(10)

lower_dob_bound = Time.new(1920,1,1)
upper_dob_bound = Time.new(1989,2,10)

lower_date_bound = Time.new(2009,3,4)
upper_date_bound = Time.now

(1..number_of_patients).each do |i|
  #Demographics
  full_name = full_names[rand(full_names.length)]
  provider = providers[rand(providers.length)]
  dob = rand(lower_dob_bound..upper_dob_bound)
  orders = []
  results = []
  #Orders
  (0..number_of_orders).each do |j|
    order_type = order_types[rand(order_types.length)]
    rendering_provider = providers[rand(providers.length)]
    order_date = rand(lower_date_bound..upper_date_bound)
    orders[j] = Order.new({:order_type => order_type,   
                 :provider => rendering_provider,
                 :date => order_date
                })
  end
  #Results
  (0..number_of_results).each do |k|
    result_type = result_types[rand(result_types.length)]
    upper_bound = ranges[result_type][:upper]
    lower_bound = ranges[result_type][:lower]

    rendering_provider = providers[rand(providers.length)]
    result_value = rand(upper_bound) + lower_bound 
    result_date = rand(lower_date_bound..upper_date_bound)
    results[k] = Result.new({
                  :result_type => result_type,
                  :provider => rendering_provider,
                  :quantity => result_value,
                  :date => result_date
                 })
  end
  #Create the Patient
  Patient.create({
    :full_name => full_name,
    :pcp => provider,
    :dob => dob,
    :orders => orders,
    :results => results
  }).save
end

