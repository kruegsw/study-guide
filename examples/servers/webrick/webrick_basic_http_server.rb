# This line loads the WEBrick module, which is part of Ruby's standard library and provides functionality for creating HTTP servers.
require 'webrick'

# Here we're defining a new class 'Echo' that will handle our HTTP requests. It inherits from WEBrick::HTTPServlet::AbstractServlet, 
# which is a base class for HTTP request handlers in WEBrick.
class Echo < WEBrick::HTTPServlet::AbstractServlet

  # This method handles HTTP GET requests. The 'request' parameter is an object representing the client's HTTP request, and 
  # 'response' is an object for building the server's HTTP response.
  def do_GET (request, response)
    # Here we're setting the body of the HTTP response to be the string representation of the HTTP request.
    response.body = request.to_s

    # This line sets the HTTP status code of the response to 200, indicating a successful request.
    response.status = 200
  end

  # This method handles HTTP POST requests in a similar way to the do_GET method.
  def do_POST (request, response)
    # In this case, we're setting the response body to be the body of the request, effectively echoing back the data sent by the client.
    response.body = request.body

    # Again, we're setting the status code to 200 to indicate success.
    response.status = 200
  end
end

# This line creates a new instance of WEBrick::HTTPServer, which is the main class for creating HTTP servers in WEBrick. 
# The server will listen on port 8000.
server = WEBrick::HTTPServer.new(:Port => 8000)

# Here we're "mounting" our Echo class at the root path ("/") of the server. This means that any HTTP requests to the root path will be 
# handled by the Echo class.
server.mount "/", Echo

# This is a bit of a special line. The 'trap' function is used to specify a block of code to be run when a certain signal is received by the script.
# In this case, the signal is "INT", which is sent when you press Ctrl+C in the terminal. When this signal is received, the server is shut down.
trap "INT" do server.shutdown end

# Finally, this line starts the server. The script will then enter a loop, waiting for HTTP requests and passing them to the Echo class to be handled.
server.start
