require 'sinatra'

set :bind, '0.0.0.0' # this line makes the web page accessible to other computer within the same network

# This is a simple in-memory store for our blog posts.
# In a real app, you would likely use a database instead.
BLOG_POSTS = [
  { id: 1, title: 'First post', body: 'This is my first post.' },
  { id: 2, title: 'Second post', body: 'This is my second post.' },
  # Add as many posts as you want...
]

get '/' do
  @posts = BLOG_POSTS
  erb :index
end

get '/page_1' do
  erb :page_1
end