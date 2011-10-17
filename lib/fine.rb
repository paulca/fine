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
  
  def self.call(env)
    [200, {'Content-Type'=>'text/plain'}, StringIO.new(self.get(Rack::Request.new(env).env['REQUEST_PATH']))]
  end
end