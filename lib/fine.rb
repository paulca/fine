class Fine
  def self.routes
    @routes ||= {}
  end
  
  def self.route(route, options = {})
    klass, method = options[:to].split('#', 2)
    self.routes[route] = {:class => klass, :method => method}
  end
  
  def self.get(route, params = {})
    raise "You need to set up a route for '#{route}'" unless self.routes[route]
    route = self.routes[route]
    instance = Kernel.const_get(route[:class]).new
    instance.params = params
    instance.send(route[:method])
  end
  
  attr_accessor :params
  
  def self.call(env)
    request = Rack::Request.new(env)
    env = request.env
    output = StringIO.new(self.get(env['REQUEST_PATH'], request.params))
    [200, {'Content-Type'=>'text/plain'}, output]
  end
end