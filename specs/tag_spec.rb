require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/Tag.rb')

class TestTagClass < MiniTest::Test

  def test_can_create_tag
    tag = Tag.new( {
      "tag_name" => "groceries"
      })
    assert_equal("groceries", tag.tag_name)
    assert_equal(true, tag.is_a?(Tag))
  end
end