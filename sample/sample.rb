require 'fine'

class Sample
  def index
    'listing the things'
  end
end

class SampleApp < Fine
  route '/', :to => "Sample#index"
end