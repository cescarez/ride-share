# Author: Christabel Sebastian
# Last updated: September 10, 2020
# Ada Developer's Academy C14
# Ada Stage 1 Assignment, "Ride Share": https://github.com/Ada-C14/ride-share
# Sources:
## https://ruby-doc.org/core-2.6.5/Hash.html
## https://ruby-doc.org/core-2.6.5/Enumerator.html
# Future modifications: use enumerators for "highest" methods

data_by_driver = {
  DR0001: [
    {
    ride_date: "3rd Feb 2016",
    ride_cost: 10,
    rider: "RD0003",
    ride_rating: 3
    },
    {
    ride_date: "3rd Feb 2016",
    ride_cost: 30,
    rider: "RD0015",
    ride_rating: 4
    },
    {
    ride_date: "5th Feb 2016",
    ride_cost: 45,
    rider: "RD0003",
    ride_rating: 2
    }
  ],
  DR0002: [
    {
    ride_date: "3rd Feb 2016",
    ride_cost: 25,
    rider: "RD0073",
    ride_rating: 5
    },
    {
    ride_date: "4th Feb 2016",
    ride_cost: 15,
    rider: "RD0013",
    ride_rating: 1
    },
    {
    ride_date: "5th Feb 2016",
    ride_cost: 35,
    rider: "RD0066",
    ride_rating: 3
    }
  ],
  DR0003: [
    {
    ride_date: "4th Feb 2016",
    ride_cost: 5,
    rider: "RD0066",
    ride_rating: 5
    },
    {
    ride_date: "5th Feb 2016",
    ride_cost: 50,
    rider: "RD0003",
    ride_rating: 2
    }
  ],
  DR0004:  [
    {
    ride_date: "3rd Feb 2016",
    ride_cost: 5,
    rider: "RD0022",
    ride_rating: 5
    },
    {
    ride_date: "4th Feb 2016",
    ride_cost: 10,
    rider: "RD0022",
    ride_rating: 4
    },
    {
    ride_date: "5th Feb 2016",
    ride_cost: 20,
    rider: "RD0073",
    ride_rating: 5
    }
  ]
}

#METHODS##########################################################
# - the number of rides each driver has given
def total_rides(database, driver)
  total_rides = database[driver].count
  return total_rides
end

# Use an iteration blocks to print the following answers:
def total_earnings(database, driver)
  total_earnings = database[driver].each.sum { |ride| ride[:ride_cost] }
  return total_earnings
end

# - the total amount of money each driver has made
def average_rating(database, driver)
  total_rating = database[driver].each.sum { |ride| ride[:ride_rating] }
  average_rating = total_rating / total_rides(database, driver)
  return  average_rating
end

# - the average rating for each driver
def highest_earner(database)
  driver_earnings = database.each_key.map { |driver| { "#{driver}": total_earnings(database, driver) } }
  highest_earner = (driver_earnings.max_by { |earning| earning.values }).keys.first
  return highest_earner
end

# - Which driver made the most money?
def highest_rated(database)
  driver_ratings = database.each_key.map { |driver| { "#{driver}": average_rating(database, driver) } }
  highest_rated = (driver_ratings.max_by { |rating| rating.values }).keys.first
  return highest_rated
end

# - Which driver has the highest average rating?
#HOW BY .max OR OTHER ENUMERABLE???
def highest_earning_day(database, driver)
  current_date = nil
  highest_earning_day = nil
  current_earnings = 0
  highest_earnings = 0
  driver_data_by_date = database[driver].sort_by { |ride| ride[:ride_date]  }
  driver_data_by_date.each do |ride|
    if ride[:ride_date] == current_date
      current_earnings += ride[:ride_cost]
    else
      current_date = ride[:ride_date]
      current_earnings = ride[:ride_cost]
    end
    if current_earnings > highest_earnings
      highest_earnings = current_earnings
      highest_earning_day = current_date
    end
  end
  return highest_earning_day
end

#Main program. Print each driver info.
data_by_driver.each_key do |driver|
  puts "#{driver}: "
  puts "Total Rides Given: #{total_rides(data_by_driver, driver)}"
  puts "Total Earnings: #{total_earnings(data_by_driver, driver)}"
  puts "Average Rating: #{"%.1f"%average_rating(data_by_driver, driver)}"
  puts "Highest Earning Day: #{highest_earning_day(data_by_driver, driver)}"
  puts
end

puts "The driver that made the most money was #{highest_earner(data_by_driver)}"
puts "The driver with the highest average rating was #{highest_rated(data_by_driver)}"
