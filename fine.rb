class Fine
  def self.routes
    @routes ||= {}
  end
  
  def self.route(route, options = {})
    klass, method = options[:to].split('#', 2)
    self.routes[route] = {:class => klass, :method => method}
  end
  
  def self.get(route)
    route = self.routes[route]
    Kernel.const_get(route[:class]).new.send(route[:method])
  end
  
  attr_accessor :body
end