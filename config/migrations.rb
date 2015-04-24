#table migrations
migration "create sender table" do
  database.create_table:users do
    primary_key :id
    String :type
    String :email, :unique => true
    String :number
    String :password
  end
end

migration "create transactions" do
  database.create_table:transactions do
    primary_key :id
    String :status
    Time :pickup
    Time :deliver
    foreign_key :senderid, :users
    foreign_key :transporterid, :users
    foreign_key :assetused, :assets
    foreign_key :deliverable, :deliverables
  end
end

migration "create deliverable" do
  database.create_table:deliverables do
    primary_key :id
    String :description
    Real :weight
    String :image
    Integer :quantity
    foreign_key :owner, :users
  end
end

migration "assets" do
  database.create_table:assets  do
    primary_key :id
    String :type
    Boolean :availability
    Integer :capacity
    foreign_key :owner :users
    foreign_key :schedule :schedules
  end
end

migration "create schedule table" do
  database.create_table:schedules do
    primary_key :id
    Date :availableFrom
    Date :availableTo
  end
end

migration "create Transaction table" do
  database.create_table:transactions do
    primary_key :id
    foreign_key :transporterid, :users
    foreign_key :senderid, :users
    foreign_key :transportused :assets
  end
end

migration "create routes" do
  database.create_table:routes do
    primary_key :id
    String :from
    String :to
  end
end

migration "route-asset relation" do
  database.create_table: assetRoutes do
    primary_key :id
    foreign_key :assetUsed, :assets
    foreign_key :assetRoute, :routes
  end
end

migration "simple messaging" do
  database.create_table: messages do
    primary_key :id
    String :message
    foreign_key :transporter, :users
    foreign_key :sender, :users
    Timestamp :timestamp
  end
end

migration "request asset" do
  database.create_table: requests do
    primary_key :id
    String :status
    foreign_key :assetid, :assets
    foreign_key :senderid, :users
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
