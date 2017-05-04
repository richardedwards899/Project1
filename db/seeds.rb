require_relative( '../models/Tag.rb' )
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

person2 = Person.new({
  "first_name" => "Julia",
  "last_name" => "Styles",
  "budget" => 500_000
  })

person1.save
person2.save

tag1 = Tag.new({ "tag_name" => "groceries" })
tag2 = Tag.new({ "tag_name" => "motoring" })
tag3 = Tag.new({ "tag_name" => "clothes" })
tag4 = Tag.new({ "tag_name" => "entertainment" })
tag5 = Tag.new({ "tag_name" => "holidays" })

tag1.save
tag2.save
tag3.save
tag4.save
tag5.save



binding.pry
nil