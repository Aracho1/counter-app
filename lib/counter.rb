require_relative './database_connection'
require 'date'

class Counter
  def count
    result = DatabaseConnection.query("SELECT * FROM counter WHERE id=1;")
    result[0]['count'].to_i
  end

  def increment
    read_count = count
    result = DatabaseConnection.query("UPDATE counter SET count = '#{read_count + 1}' WHERE id=1;")
    update_time
  end

  def decrement
    read_count = count
    result = DatabaseConnection.query("UPDATE counter SET count = '#{read_count - 1}' WHERE id=1;")
    update_time
  end

  def self.instance
    @counter ||= Counter.new
  end

  def time
    result = DatabaseConnection.query("SELECT * FROM counter WHERE id=1;")
    result[0]['time']
  end

  def update_time
    DatabaseConnection.query("UPDATE counter SET time = '#{DateTime.now.strftime("%H:%M")}' WHERE id=1;")
  end
end
