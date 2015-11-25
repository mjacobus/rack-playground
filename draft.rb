# config.ru

require 'my_application'

application = MyApplication.new(self) do |rack, app|
  rack.use ThatMiddleware

  app.router do |router|
    router.get '/users' => Proc.new do |env|
      klass = UsersController
      app.dependencies.with_evinronment(env).fetch(klass).index
    end
  end

  app.router do |router|
    router.get '/users/:id' => Proc.new do |env|
      app.dependencies.with(env: env) do
        fetch(UsersController)
      end.dispatch(:show)
    end
  end

end

run application
