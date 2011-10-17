require 'test/unit'
require 'sample'

class SampleTest < Test::Unit::TestCase
  
  def test_listing_the_things
    assert_equal SampleApp.get('/'), 'listing the things'
  end
  
end