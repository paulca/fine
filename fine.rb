class Fine
  def self.routes
    @routes ||= {}
  end
  
  def self.get(route,&block)
    self.routes[route] = block
  end
  
  attr_accessor :body
  
  def initialize(route)
    self.body = self.class.routes[route].call
  end
end