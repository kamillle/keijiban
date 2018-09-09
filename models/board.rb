class Board < MysqlConnection
  def initialize(id: nil, title: nil, created_at: nil, updated_at: nil)
    @id, @title, @created_at, @updated_at = id, title, created_at, updated_at
  end

  def self.find(id)
    MysqlConnection.query(%Q(SELECT * FROM boards WHERE id='#{id}' LIMIT 1))
  end

  def self.all
    MysqlConnection.query(%Q(SELECT * FROM boards))
  end

  def self.create_and_save(title)
    MysqlConnection.query(%Q(INSERT INTO boards (title) VALUES ('#{title}')))
  end
end
