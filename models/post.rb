class Post < MysqlConnection
  def initialize(id: nil, board_id: nil, name: nil, content: nil, created_at: nil)
    @id, @board_id, @name, @content, @created_at, = id, board_id, name, content, created_at
  end

  def self.where(board_id)
    MysqlConnection.query(%Q(SELECT * FROM posts WHERE board_id='#{board_id}'))
  end

  def self.create_and_save(board_id, name, content)
    MysqlConnection.query(%Q(INSERT INTO posts (board_id, name, content) VALUES ('#{board_id}', '#{name}', '#{content}')))
  end

  def self.destroy_all(board_id)
    MysqlConnection.query(%Q(DELETE FROM posts WHERE board_id='#{board_id}'))
  end
end
