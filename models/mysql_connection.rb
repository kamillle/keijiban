require 'mysql2'

class MysqlConnection
  def self.query(statement)
    client.query(statement)
  end

  private

  def self.client
    @client = Mysql2::Client.new(
      host: 'localhost',
      port: 3306,
      username: 'root',
      database: 'keijiban_sinatra',
    )
  end
end
