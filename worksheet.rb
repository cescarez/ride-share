########################################################
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
    ride_date: "3rd Feb 2016"
    ride_cost: 10
    rider: "RD0003"
    ride_rating: 3
    },
    {
    ride_date: "3rd Feb 2016"
    ride_cost: 30
    rider: "RD0015"
    ride_rating: 4
    },
    {
    ride_date: "5th Feb 2016"
    ride_cost: 45
    rider: "RD0003"
    ride_rating: 2
    },
  ],
  DR0002: [
    {
    ride_date: "3rd Feb 2016"
    ride_cost: 25
    rider: "RD0073"
    ride_rating: 5
    },
    {
    ride_date: "4th Feb 2016"
    ride_cost: 15
    rider: "RD0013"
    ride_rating: 1
    },
    {
    ride_date: "5th Feb 2016"
    ride_cost: 35
    rider: "RD0066"
    ride_rating: 3
    },
  ],
  DR0003: [
    {
    ride_date: "4th Feb 2016"
    ride_cost: 5
    rider: "RD0066"
    ride_rating: 5
    },
    {
    ride_date: "5th Feb 2016"
    ride_cost: 50
    rider: "RD0003"
    ride_rating: 2
    },
  ],
  DR0004:  [
    {
    ride_date: "3rd Feb 2016"
    ride_cost: 5
    rider: "RD0022"
    ride_rating: 5
    },
    {
    ride_date: "4th Feb 2016"
    ride_cost: 10
    rider: "RD0022"
    ride_rating: 4
    },
    {
    ride_date: "5th Feb 2016"
    ride_cost: 20
    rider: "RD0073"
    ride_rating: 5
    },
  ]
}

def total_rides(database)
  total_rides = 0
  database.each do |driver|
    driver.each do |ride|
      total_rides = ride[:price]
    end
  end
  return total_rides
end

def total_earnings(database)
  total_earnings = 0
  database.each do |driver|
    driver.each do |ride|
      total_earnings = ride[:price]
    end
  end
  return total_earnings
end

def average_rating(database)

end

def highest_earner(database)

end

def highest_rated(database)

end

def highest_earning_day(database)

end