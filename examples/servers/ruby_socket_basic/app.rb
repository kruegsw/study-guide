# frozen_string_literal: true

require 'socket'

server = TCPServer.new('localhost', 1234)
puts('Echo server listening on port 1234...')
loop do
  Thread.start(server.accept) do |client|
    puts("Connection established with client.")
    client.puts("I will echo back your message then close the connection.")
    client_message = client.gets
    client.puts("I have received your message: #{client_message}")
    client.close
  end
end