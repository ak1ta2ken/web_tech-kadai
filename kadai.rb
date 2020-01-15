require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :PORT => '80',
})

['INT', 'TERM'].each{|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/kadai', WEBrick::HTTPServlet::ERBHandler, 'kadai.html.erb')

server.mount('/goya_give_for.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_give_for.rb')

server.mount('/goya_quality.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_quality.rb')

server.start
