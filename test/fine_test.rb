require 'fine'
require 'test/unit'

class FineApp < Fine
  route "/", :to => "FineController#index"
  route "/hello", :to => "FineController#hello"
end

class FineController < Fine
  def index
    "hello world"
  end
  
  def hello
    "hello #{params[:name]}"
  end
end

class FineTest < Test::Unit::TestCase
  
  def test_basic_route
    assert_equal "hello world", FineApp.get('/')
  end
  
  def test_base_route_with_params
    assert_equal "hello Paul", FineApp.get('/hello', {:name => "Paul"})
  end
  
end