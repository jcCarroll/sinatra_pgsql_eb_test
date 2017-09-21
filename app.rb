require 'sinatra'
require 'pg'

load './local_env.rb' if File.exists?('./local_env.rb')

db_params = {
    host: ENV['dbhost'],
    port: ENV['dbport'],
    dbname: ENV['dbname'],
    user: ENV['dbuser'],
    password: ENV['dbpassword']
	}

db = PG::Connection.new(db_params)

get '/' do
    erb :index
end

post 'add_info' do
    first = params[:fname]
    last = params[:lname]

    db.exec ("INSERT INTO names (first, last) VALUES ('#{first}', '#{last}'" )
    db.close
end