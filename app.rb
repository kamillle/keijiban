# routingを担う

require 'sinatra'
require 'slim'

# 実行したいファイルのディレクトリからの相対パスで該当のファイルを探しに行く
require_relative 'models/init'

get '/' do
  slim :index
end
