require 'lotus/router'

class Application
  attr_reader :router
  attr_reader :middleware

  def initialize(middleware)
    @middleware = middleware
    @router = Lotus::Router.new
    configure
  end

  def call(env)
    @router.call(env)
  end

  def configure
    # Not working in here at the moment
    #
    # middleware.use Rack::Reloader
    # middleware.use MiddlewareOne
    # middleware.use MiddlewareTwo
    # middleware.use MiddlewareThree

    content = "Hello world"
    router.get "/", to: ->(env) { [200, {}, [content]] }
    router.get "/foo", to: ->(env) { [200, {}, [content, "foo"]] }
  end
end


