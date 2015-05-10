require 'pry'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject  
  def self.columns
    raw_data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name} LIMIT 0
    SQL

    raw_data[0].map do |column|
      column.to_sym
    end
  end

  def self.finalize!
    columns.each do |column|
      define_method(column.to_sym) do
        attributes[column.to_sym]
      end

      define_method("#{column.to_sym}=") do |value|
        attributes[column.to_sym] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.downcase.pluralize
  end

  def self.all
    raw_data = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    parse_all(raw_data)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    # binding.pry
    raw_data = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ? LIMIT 1
    SQL

    parse_all(raw_data).first
  end

  def initialize(params = {})
    params.each do |name, value|
      unless self.class.columns.include?(name.to_sym)
        raise "unknown attribute '#{name.to_sym}'"
      end
      attributes[name.to_sym] = value
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attributes_hash
    attr_values = {}
    self.class.columns.each do |column|
      attr_values[column.to_sym] = self.send(column.to_sym)
    end

    attr_values
  end

  def attribute_values
    attributes_hash.values
  end

  def insert
    raise "can't insert existing object" unless self.id.nil?
    attr_hash = attributes_hash.reject { |k,v| k == :id && v.nil? }
    # binding.pry
    question_marks = (["?"] * attr_hash.size).join(", ")
    col_names = attr_hash.keys.join(', ')

    DBConnection.execute(<<-SQL, *(attr_hash.values))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks});
    SQL
    new_id = DBConnection.last_insert_row_id
    self.id = new_id
    # self.class.find(new_id)
  end

  def update
    attr_hash = attributes_hash
    raise "can't update new objects" if attr_hash[:id].nil?

    attr_hash = attributes_hash.reject { |k,v| k == :id}
    column_update_string = attr_hash.keys.join(" = ?, ") + " = ?"

    DBConnection.execute(<<-SQL, *(attr_hash.values.concat([self.id.to_s])))
      UPDATE
        #{self.class.table_name}
      SET
        #{column_update_string}
      WHERE
        id = ?
    SQL




  end

  def save
    if self.id.nil?
      insert
    else
      update
    end
  end
end
