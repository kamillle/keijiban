# routingを担う

require 'sinatra'
require 'sinatra/reloader'
require 'mysql2'
require 'pry'

# 実行したいファイルのディレクトリからの相対パスで該当のファイルを探しに行く
require_relative 'models/mysql_connection'
require_relative 'models/board'
require_relative 'models/post'

helpers do
  def link_to(path, description)
    %Q(<a href="http://localhost:4567/#{path}">#{description}</a>)
  end
end

# root
get '/' do
  @all_boards = Board.all

  erb :index
end

# Boards#new
get '/boards/new' do
  erb :new_board
end

# Boards#create
post '/boards' do
  title = params[:title]
  Board.create_and_save(title)

  redirect to('/'), 302
end

# Boards#show
get '/board/:id' do
  halt 404, "無効なURLです" unless params[:id] =~ /^[0-9]+$/

  @board = Board.find(params[:id].to_i).first
  @posts = Post.where(params[:id].to_i)

  erb :show_board
end

# Post#create
post '/posts' do
  Post.create_and_save(params[:board_id], params[:name], params[:content])

  redirect to("/board/#{params[:board_id]}")
end
