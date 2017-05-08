require_relative( '../models/Tag.rb' )
require_relative( '../models/Transaction.rb' )
require_relative( '../models/Person.rb' )
require('pry-byebug')

Transaction.delete_all
Tag.delete_all
Person.delete_all

#create some Tags, Transactions and Persons and save them to the database.

#Hard-codes the user's details...
person1 = Person.new({
  "first_name" => "Richard",
  "last_name" => "Edwards",
  "budget" => 10_000
  })

person1.save

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

transaction1 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag1.id,
  "merchant" => "Tesco",
  "value" => "10",
  "purchased_on" => "17/3/2017"
  })
transaction2 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag2.id,
  "merchant" => "Ian Murray Motorcycles",
  "value" => "150",
  "purchased_on" => "20/3/2017"
  })
transaction3 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag3.id,
  "merchant" => "Top Shop",
  "value" => "25",
  "purchased_on" => "11/2/2017"
  })
transaction4 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag4.id,
  "merchant" => "Vue Cinemas",
  "value" => "29",
  "purchased_on" => "10/2/2017"
  })
transaction5 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag5.id,
  "merchant" => "Hotel de Las Ramblas",
  "value" => "175",
  "purchased_on" => "1/2/2017"
  })

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save


binding.pry
nil