require 'active_support/inflector'

class DBRecord

  def save
    p self.class.to_s.downcase.pluralize
    db_klass = self.class.to_s.downcase.pluralize
    arg_names = self.instance_variables.map do |arg|
      arg.to_s.chars.drop(1).join("")
    end


    args = arg_names.map { |arg_name| self.send(arg_name.to_sym) }

    p arg_names
    if args.last.nil?
      # QuestionsDatabase.execute(<<-SQL, *args)
      #   INSERT INTO
      #     #{db_klass}(#{arg_names.join(",")})
      #   VALUES
      #     ( #{('?,'*(args.count))[0...-1]} )
      # SQL
      #
      # @id = QuestionsDatabase.instance.last_insert_row_id

    else
      # QuestionsDatabase.execute(<<-SQL, *args)
      #   UPDATE
      #   #{db_klass}
      #   SET
      #     #{(arg_names.drop(1).join(' = ?,'))[0...-1]}
      #   WHERE
      #     id = ?
      # SQL
    end

    self
  end


  def destroy

  end

end


#
# def save
#   if @id.nil?
#     QuestionsDatabase.execute(<<-SQL, @fname, @lname)
#       INSERT INTO
#         users(fname, lname)
#       VALUES
#         (?, ?);
#     SQL
#
#     @id = QuestionsDatabase.instance.last_insert_row_id
#   else
#     QuestionsDatabase.execute(<<-SQL, @fname, @lname, @id)
#       UPDATE
#         users
#       SET
#         fname = ?,
#         lname = ?
#       WHERE
#         id = ?;
#     SQL
#   end
#
#   self
# end
