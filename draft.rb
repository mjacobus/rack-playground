# config.ru

require 'my_application'

application = MyApplication.new(self) do |rack, app|
  rack.use ThatMiddleware

  app.router do |router|
    router.get '/users' => Proc.new do |env|
      klass = UsersController
      application.dependencies.with_evinronment(env).fetch(klass).index
    end
  end

end

run application
