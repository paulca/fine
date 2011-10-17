require 'test/unit'
require 'rack/test'
require 'sample'

class SampleTest < Test::Unit::TestCase
  
  def test_listing_the_things
    assert_equal SampleApp.get('/'), 'listing the things'
  end
  
  def test_hello
    assert_equal SampleApp.get('/hello', {'name' => "Paul"}), 'hello Paul'
  end
  
end