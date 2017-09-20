require 'sinatra'
require 'pg'

load './local_env.rb' if File.exists?('./local_env.rb')

get '/' do
    erb :index
end