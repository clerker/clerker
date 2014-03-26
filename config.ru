require './config/environment'
require './config/multitenant' if $multitenant

# Common Rack Setup

$stack = []

use Rack::CommonLogger, $logger
use Rack::Session::Cookie, secret: ENV['COOKIE_SECRET'] || "d88713a0d7b1b2f55c8a35f2b73d2ca79c4041a8"

if $multitenant
  use OmniAuth::Strategies::StripeConnect, ENV['STRIPE_CONNECT_ID'], ENV['STRIPE_CONNECT_SECRET'], name: 'stripe', scope: 'read_write'
  $stack = [Multitenant::Auth] + $stack
end

run Rack::Cascade.new($stack)