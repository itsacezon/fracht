require 'bcrypt'
require 'csv'

file = ""

CSV.foreach(File.path("generated.csv")) do |row|
  name = row[0]
  email = row[1]
  hash = BCrypt::Password.create(row[2])

  file << name + ',' + email + ',' + hash  + "\n"
end

File.open('data.csv', 'w') do |f|
  f.write file
end
