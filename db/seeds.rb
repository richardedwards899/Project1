# require_relative( '../models/Tag.rb' )
# require_relative( '../models/Transaction.rb' )
require_relative( '../models/Person.rb' )
require('pry-byebug')

# Tag.delete_all
# Transaction.delete_all
# Person.delete_all

#create some Tags, Transactions and Persons and save them to the database.

person1 = Person.new({
  "first_name" => "Robert",
  "last_name" => "Redford",
  "budget" => 1_000_000
  })

# person1.save

binding.pry
nil