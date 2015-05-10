require 'pry-byebug'
require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_filters= params.map { |k,v| "#{k} = ?" }.join(" AND ")
    where_values = params.map { |k,v| v.to_s }

    raw_data = DBConnection.execute(<<-SQL, where_values )
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_filters}
    SQL

    parse_all(raw_data)
  end
end

class SQLObject
  extend Searchable
end
