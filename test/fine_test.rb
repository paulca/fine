require 'fine'
require 'test/unit'

class FineApp < Fine
  route "/", :to => "FineController#index"
  route "/hello", :to => "FineController#hello"
  route "/inside", :to => "inside"
  
  def inside
    "inside the app"
  end
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
  
  def test_method_inside_the_router
    assert_equal "inside the app", FineApp.get('/inside')
  end
  
end