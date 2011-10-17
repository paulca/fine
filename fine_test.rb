require 'fine'
require 'test/unit'

class FineRouter < Fine
  route "/", :to => "FineApp#index"
end

class FineApp
  def index
    "hello world"
  end
end

class FineTest < Test::Unit::TestCase
  
  def test_basic_route
    assert_equal "hello world", FineRouter.get('/')
  end
  
end