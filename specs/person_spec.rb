require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/Person.rb')

class TestPersonClass < MiniTest::Test

  def test_can_create_person
    person = Person.new("Richard", "Edwards", 1000)
    assert_equal("Richard", person.first_name)
    assert_equal("Edwards", person.last_name)
    assert_equal(1000, student.budget)
  end

end