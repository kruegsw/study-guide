require 'sinatra'

set :bind, '0.0.0.0' # this line makes the web page accessible to other computer within the same network

get '/' do

  @time = Date.today

  erb :index
end

get '/test/:route_param' do
  @time = :route_param
  erb :index
end

get '/update_content' do

  @tier_counter = 1

  view_file_name = params[:viewFileName] # Access the value of the "viewFileName" parameter
  layout_template = params[:layoutTemplate] # Access the value of the "layoutTemplate" parameter
  
  # Logic to retrieve and generate the updated content
  updated_content = erb view_file_name.to_sym, layout: layout_template.to_sym

  # Return the updated content as JSON
  content_type :json
  { content: updated_content }.to_json
end
