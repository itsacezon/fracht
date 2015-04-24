migration "create users table" do
  database.create_table :users do
    primary_key :id
    String :nickname
    String :email, :unique => true
    String :hashed_password
    String :ip_address
    Time :voted_on
    Boolean :has_voted, :default => false
  end
end

migration "create positions table" do
  database.create_table :positions do
    primary_key :id
    String :position
  end
end

migration "create candidates table" do
  database.create_table :candidates do
    primary_key :id
    String :candidate
    foreign_key :positionid, :positions
  end
end

migration "create votes table" do
  database.create_table :votes do
    primary_key :id
    foreign_key :candidateid, :candidates
  end
end

migration "create abstains table" do
  database.create_table :abstains do
    primary_key :id
    foreign_key :positionid, :positions
  end
end

####################
# SEEDING DATABASE #
####################
require 'csv'
users = database[:users]
CSV.foreach(File.path("ignore/data.csv")) do |row|
  users.insert(
    :nickname => row[0],
    :email => row[1],
    :hashed_password => row[2]
  )
end

positions = database[:positions]
positions.insert(:position => "Chair")
positions.insert(:position => "Vice-Chair & Membership")
positions.insert(:position => "Secretary & Records")
positions.insert(:position => "Treasurer & Finance")
positions.insert(:position => "Marketing")
positions.insert(:position => "Logistics")
positions.insert(:position => "Education")
positions.insert(:position => "Publicity")
positions.insert(:position => "Public Relations")

candidates = database[:candidates]
CSV.foreach(File.path("ignore/candidates.csv"), encoding: "UTF-8") do |row|
  candidates.insert(
    :candidate => row[0],
    :positionid => row[1]
  )
end
