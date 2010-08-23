require 'rubygems'
require 'rack'
require 'rack-rewrite'

use Rack::Static, :urls => ["/"], :root => "output"
run Rubyzome::RestfulDispatcher.new
