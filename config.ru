require 'rack'

class Base
  def initialize(app = nil)
    @app = app
  end

  def call(env)
    env['body'] ||= []

    # if @app
    #   env['body'] << "<li>#{@app.class} / #{self.class}</li>"
    # else
      env['body'] << "<li>#{self.class}</li>"
    # end

    @app.call(env)
  end
end

class MiddlewareThree < Base; end
class MiddlewareTwo < Base; end
class MiddlewareOne < Base; end

class Application
  def call(env)
    [200, {'Content-Type' => 'text/html'}, env['body']]
  end
end


# use Rack::Reloader
use MiddlewareOne
use MiddlewareTwo
use MiddlewareThree
run Application.new
