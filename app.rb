require 'sinatra'

load './local_env.rb' if File.exists?('./local_env.rb')

get '/' do
    erb :index
end

post 'add_info' do
    first = params[:fname]
    last = params[:lname]
end