require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def self.execute(*args, &blc)
    QuestionsDatabase.instance.execute(*args, &blc)
  end

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end
