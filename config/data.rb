class User < Sequel::Model
  one_to_many :votes
end

class Position < Sequel::Model
end

class Candidate < Sequel::Model
  one_to_many :votes
  one_to_one :positions
end

class Vote < Sequel::Model
  many_to_one :candidates
end

class Abstain < Sequel::Model
end
