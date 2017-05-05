require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/Transaction.rb')
require_relative('../models/Tag.rb')
require_relative('../models/Person.rb')

class TestTransactionClass < MiniTest::Test

  def test_can_create_transaction

    person = Person.new({
      "first_name" => "Reggie",
      "last_name" => "Buttons",
      "budget" => 1050
      })

    tag = Tag.new({
      "tag_name" => "groceries"
      })

    transaction = Transaction.new( {
      "person_id" => person.id,
      "tag_id" => tag.id,
      "merchant" => "Tesco",
      "value" => "10",
      "purchased_on" => "17/2/2017"
      })
    assert_equal("Tesco", transaction.merchant)
    assert_equal(10, transaction.value)
    assert_equal("17/2/2017", transaction.purchased_on)
  end

end