class Fine
  def self.routes
    @routes ||= {:get => {}, :head => {}, :index => {},
                 :post => {}, :put => {}, :options => {}}
  end

  routes.keys.each do |_meth|
    class_eval """
      def self.#{_meth} route, options = {}
        puts \"Inspected Options: \#\{options.inspect\}\"
        route route, {:method => :#{_meth}}.merge(options)
      end
    """
  end
  
  def self.route(route, options = {})
    _method = options[:method] || :get

    if self.get_route(_method, route)
      self.route_request _method, route, options
    else
      puts "Route: #{route.inspect}"
      puts "Options: #{options.inspect}"
      if options[:to].index('#')
        klass, method = options[:to].split('#', 2)
      else
        controller = self
        action = options[:to]
      end
      if route.index(':')

      else
        self.routes[_method][route] = {:controller => controller,
                                       :action => action}
      end
    end
  end
  
  def self.get_route(_method, route_string)
    self.routes[_method][route_string]
  end
  
  def self.route_request(_method, route, params = {})
    route = self.get_route(_method, route)
    raise "You need to set up a #{_method} route for '#{route}'" if !route
    instance = route[:controller].new if route[:controller].respond_to?(:new)
    instance ||= Kernel.const_get(route[:controller]).new
    instance.params = params
    instance.send(route[:action])
  end
  
  attr_accessor :params
  
  def self.call(env)
    request = Rack::Request.new(env)
    env = request.env
    puts request
    output = StringIO.new(self.route_request(env['PATH_INFO'], request.params))
    [200, {'Content-Type'=>'text/html'}, output]
  end
end