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
  "budget" => 5_000.00
  })

person1.save

tag1 = Tag.new({ "tag_name" => "Groceries" })
tag2 = Tag.new({ "tag_name" => "Motoring" })
tag3 = Tag.new({ "tag_name" => "Clothes" })
tag4 = Tag.new({ "tag_name" => "Entertainment" })
tag5 = Tag.new({ "tag_name" => "Holidays" })

tag1.save
tag2.save
tag3.save
tag4.save
tag5.save

transaction1 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag1.id,
  "merchant" => "Tesco",
  "value" => "10.99",
  "purchased_on" => "17/3/2017"
  })
transaction2 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag2.id,
  "merchant" => "Ian Murray Motorcycles",
  "value" => "150.80",
  "purchased_on" => "20/3/2017"
  })
transaction3 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag3.id,
  "merchant" => "Top Shop",
  "value" => "25.00",
  "purchased_on" => "11/2/2017"
  })
transaction4 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag4.id,
  "merchant" => "Vue Cinemas",
  "value" => "29.19",
  "purchased_on" => "10/2/2017"
  })
transaction5 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag5.id,
  "merchant" => "Hotel de Las Ramblas",
  "value" => "175.99",
  "purchased_on" => "1/2/2017"
  })
transaction6 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag1.id,
  "merchant" => "Sainsburys",
  "value" => "65.73",
  "purchased_on" => "17/1/2017"
  })
transaction7 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag2.id,
  "merchant" => "Ian Murray Motorcycles",
  "value" => "250.00",
  "purchased_on" => "20/4/2017"
  })
transaction8 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag3.id,
  "merchant" => "New Look",
  "value" => "40.00",
  "purchased_on" => "11/2/2017"
  })
transaction9 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag4.id,
  "merchant" => "The Slug and Lettuce",
  "value" => "13.20",
  "purchased_on" => "10/5/2017"
  })
transaction10 = Transaction.new({
  "person_id" => person1.id,
  "tag_id" => tag5.id,
  "merchant" => "Aeropuerto de Malaga",
  "value" => "99.99",
  "purchased_on" => "1/2/2017"
  })

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save
transaction10.save

binding.pry
nil