require 'fine'
require 'test/unit'

class FineApp < Fine
  route "/", :to => "FineApp#index"
  
  def index
    "hello world"
  end
end

class FineTest < Test::Unit::TestCase
  
  def test_basic_route
    assert_equal "hello world", FineApp.get('/')
  end
  
end