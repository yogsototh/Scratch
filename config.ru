require 'rubygems'
require 'rack'
require 'rack-rewrite'

use Rack::Rewrite do
    rewrite %r{(.*)/$},"$1/index.html"
end
use Rack::Static, :urls => ["/"], :root => "output"
app = lambda { |env| [404, { 'Content-Type' => 'text/html' }, 'File Not Found'] }
run app
