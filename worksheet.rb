#######################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?


data_by_driver = {
  DR0001: [
    {
    ride_date: "3rd Feb 2016",
    ride_cost: 10,
    rider: "RD0003",
    ride_rating: 3,
    },
    {
    ride_date: "3rd Feb 2016",
    ride_cost: 30,
    rider: "RD0015",
    ride_rating: 4,
    },
    {
    ride_date: "5th Feb 2016",
    ride_cost: 45,
    rider: "RD0003",
    ride_rating: 2,
    }
  ],
  DR0002: [
    {
    ride_date: "3rd Feb 2016",
    ride_cost: 25,
    rider: "RD0073",
    ride_rating: 5,
    },
    {
    ride_date: "4th Feb 2016",
    ride_cost: 15,
    rider: "RD0013",
    ride_rating: 1,
    },
    {
    ride_date: "5th Feb 2016",
    ride_cost: 35,
    rider: "RD0066",
    ride_rating: 3,
    }
  ],
  DR0003: [
    {
    ride_date: "4th Feb 2016",
    ride_cost: 5,
    rider: "RD0066",
    ride_rating: 5,
    },
    {
    ride_date: "5th Feb 2016",
    ride_cost: 50,
    rider: "RD0003",
    ride_rating: 2,
    }
  ],
  DR0004:  [
    {
    ride_date: "3rd Feb 2016",
    ride_cost: 5,
    rider: "RD0022",
    ride_rating: 5,
    },
    {
    ride_date: "4th Feb 2016",
    ride_cost: 10,
    rider: "RD0022",
    ride_rating: 4,
    },
    {
    ride_date: "5th Feb 2016",
    ride_cost: 20,
    rider: "RD0073",
    ride_rating: 5,
    }
  ]
}

def total_rides(database, driver)
  total_rides = database[driver].count
  return total_rides
end

def total_earnings(database, driver)
  total_earnings = database[driver].each.sum { |ride| ride[:ride_cost] }
  return total_earnings
end

def average_rating(database, driver)
  total_rating = 0
  database[driver].each { |ride| total_rating += ride[:ride_rating] }
  average_rating = total_rating / total_rides(database, driver)
  return  average_rating
end

#HOW BY .max OR OTHER ENUMERABLE???
def highest_earner(database)
  highest_earnings = 0
  highest_earner = nil
  database.each_key do |driver|
    driver_earnings = total_earnings(database, driver)
    if (driver_earnings > highest_earnings)
      highest_earnings = driver_earnings
      highest_earner = driver
    end
  end
  return highest_earner
end

#HOW BY .max OR OTHER ENUMERABLE???
def highest_rated(database)

end

#HOW BY .max OR OTHER ENUMERABLE???
def highest_earning_day(database)

end

#Main program. Print each driver info.
data_by_driver.each_key do |driver|
  puts "#{driver}: "
  puts "Total Rides Given: #{total_rides(data_by_driver, driver)}"
  puts "Total Earnings: #{total_earnings(data_by_driver, driver)}"
  puts "Average Rating: #{"%.1f"%average_rating(data_by_driver, driver)}"
  puts
end

puts "The highest earning driver was #{highest_earner(data_by_driver)}"


















#METHOD GRAVEYARDdef total_rides(database, driver)
# def total_rides(database, driver)
#   total_rides = 0
#   database[driver].each { total_rides += 1 }
#   return total_rides
# end
#
# def total_earnings(database, driver)
#   total_earnings = 0
#   database[driver].each { |ride| total_earnings += ride[:ride_cost] }
# end
#
# def average_rating(database, driver)
#   total_rating = 0
#   database[driver].each { |ride| total_rating += ride[:ride_rating] }
#   average_rating = total_rating / total_rides(database, driver)
#   return  average_rating
# end
#
# #HOW BY .max OR OTHER ENUMERABLE???
# def highest_earner(database)
#   highest_earnings = 0
#   highest_earner = nil
#   database.each_key do |driver|
#     driver_earnings = total_earnings(database, driver)
#     if (driver_earnings > highest_earnings)
#       highest_earnings = driver_earnings
#       highest_earner = driver
#     end
#   end
#   return highest_earner
# end
#
#HOW BY .max OR OTHER ENUMERABLE???
# def highest_rated(database)
#
# end
#
# #HOW BY .max OR OTHER ENUMERABLE???
# def highest_earning_day(database)
#
# end
