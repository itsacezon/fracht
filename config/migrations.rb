#table migrations
migration "create sender table" do
  database.create_table:user do
    primary_key :id
    String :type
    String :email, :unique => true
    String :number
    String :password
  end
end

migration "create transactions" do
  database.create_table:transactions do
    primary_key: id
    foreign_key: :senderid, :user
    foreign_key: :transporterid, :user
  end
end

migration "assets" do
  database.create_table:assets  do
    primary_key :id
    String :type
    Boolean :availability
    Integer :capacity
    foreign_key :owner :user
    foreign_key :schedule :sched
  end
end

migration "create schedule table" do
  database.create_table:sched do
    primary_key :id
    Date :availableFrom
    Date :availableTo
  end
end

migration "create Transaction table" do
  database.create_table:transaction do
    primary_key :id
    foreign_key :transporterid, :user
    foreign_key :senderid, :user
    foreign_key :transportused :assets
  end
end

migration "create routes" do
  database.create_table:route do
    primary_key :id
    String :from
    String :to
  end
end

migration "route-asset relation" do
  database.create_table: assetRoute do
    primary_key :id
    foreign_key :assetUsed, :assets
    foreign_key :assetRoute, :route
  end
end
