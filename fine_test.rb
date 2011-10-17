require 'fine'
require 'test/unit'

class FineApp < Fine
  get "/" do
    "hello world"
  end
end

class FineTest < Test::Unit::TestCase
  
  def test_basic_route
    assert_equal "hello world", FineApp.new('/').body
  end
  
end