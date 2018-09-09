# routingを担う

require 'sinatra'
require 'mysql2'
require 'pry'

# 実行したいファイルのディレクトリからの相対パスで該当のファイルを探しに行く
require_relative 'models/init'

helpers do
  def link_to(path, description)
    %Q(<a href="http://localhost:4567/#{path}">#{description}</a>)
  end
end

# Mysqlドライバの設定
client = Mysql2::Client.new(
  host: 'localhost',
  port: 3306,
  username: 'root',
  database: 'keijiban_sinatra',
)

# root
get '/' do
  @all_boards = client.query("SELECT * FROM boards;")

  erb :index
end

# Boards#new
get '/boards/new' do
  erb :new_board
end

# Boards#create
post '/boards' do
  title = params[:title]
  query  = %Q(INSERT INTO boards (title) VALUES ('#{title}'))
  result = client.query(query)

  redirect to('/')
end

# Boards#show
get '/board/:id' do
  halt 404, "無効なURLです" unless params[:id] =~ /^[0-9]+$/

  id     = params[:id]
  query  = %Q(SELECT * FROM boards WHERE id='#{id}')
  result = client.query(query)
  @board = result.first

  erb :show_board
end
