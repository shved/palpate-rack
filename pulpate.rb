require 'rack'

body_parts = %w(hand leg chest stomack head neck finger arm)

pulpate = Proc.new do |env|
  if body_parts.include? env['REQUEST_PATH'][1..-1]
    [
      200,
      {'Content-Type' => 'text/html'},
      ["#{env['REQUEST_PATH'][1..-1]} is ok"]
    ]
  else
    [200, {'Content-Type' => 'text/html'}, ['sorry, there is no such body part']]
  end
end

Rack::Handler::WEBrick.run pulpate
