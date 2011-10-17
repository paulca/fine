require 'fine'
require 'erb'

class Sample < Fine
  def index
    'listing the things'
  end
  
  def hello
    "hello #{params['name']}"
  end
end

class SampleApp < Fine
  route '/', :to => "Sample#index"
  route '/hello', :to => "Sample#hello"
end
