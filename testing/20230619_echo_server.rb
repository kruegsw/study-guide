require 'socket'

server = TCPServer.new 1234
puts "Server listening on port 1234..."

3.times do |socket_counter|
  client = server.accept; puts "Connect made to client number #{socket_counter + 1} (#{client.peeraddr})"; client.puts "Hello client, connection established."
  result = client.gets
  puts "Client number #{socket_counter + 1} has sent a message:  #{result}"
  client.puts "Client number #{socket_counter + 1} I received your message (#{result
})."
  while !client.closed? do; client.puts "Would you like to close your connection?  (y/n)"
    response = client.gets.chomp;
    if response == "y"
	    client.puts "Closing connection..."
	    puts "Closing connection with client..."
	    client.close
	  end
  end
end
