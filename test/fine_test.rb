require 'fine'
require 'minitest/test'

class FineApp < Fine
  # get "/", :to => "FineController#index"
  # get "/hello", :to => "FineController#hello"
  # get "/inside", :to => "inside"
  route "/with/:id", :to => "with_id"
  
  
  def inside
    "inside the app"
  end
  
  def with_id
    "id is #{params[:id]}"
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

class FineTest < Minitest::Test
  
  # def test_basic_route
  #   assert_equal "hello world", FineApp.get('/')
  # end
  
  # def test_base_route_with_params
  #   assert_equal "hello Paul", FineApp.get('/hello', {:name => "Paul"})
  # end
  
  # def test_method_inside_the_router
  #   assert_equal "inside the app", FineApp.get('/inside')
  # end
  
  def test_with_param_in_url
    assert_equal "id is 1", FineApp.get('/with/1')
  end
  
end