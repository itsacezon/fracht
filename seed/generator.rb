require 'bcrypt'
require 'csv'

file = ""

CSV.foreach(File.path("data.csv")) do |row|
  name = row[0]
  email = row[1]
  hash = row[2]

  file << 'sender,'+name + ',' + email + ',123456,' + hash  + "\n"
end

File.open('data.csv', 'w') do |f|
  f.write file
end

file = ""

CSV.foreach(File.path("data2.csv")) do |row|
  name = row[0]
  email = row[1]
  hash = row[2]

  file << 'transporter,'+name + ',' + email + ',123456,' + hash  + "\n"
end

File.open('data2.csv', 'w') do |f|
  f.write file
end
