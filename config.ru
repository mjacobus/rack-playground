require 'rack'
require './application'

# http://madlep.com/blog/2015/03/14/rack-reloader-not-reloading/
app = Rack::Builder.new do
  use Rack::Reloader
  run lambda { |env| Application.new(self).call(env) }
end.to_app

run app
