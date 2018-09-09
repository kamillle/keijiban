require_relative 'models/mysql_connection'
require_relative 'models/post'

namespace :destroy_all_posts_on_a_board do
  desc "destroy all posts on specific board"

  task :execute, :board_id do |task, args|
    Post.destroy_all(args[:board_id].to_i)
  end
end
