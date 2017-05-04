require_relative('../db/sql_runner.rb')

class Person

  attr_reader :first_name, :last_name, :budget

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @budget = params['budget'].to_i
  end

  def save
    sql = "INSERT INTO people ( first_name, last_name, budget ) VALUES ( '#{@first_name}', '#{@last_name}', #{@budget} ) RETURNING id;"
    @id = SqlRunner.run(sql)[0][:id].to_i
  end  

  # def house
  #   sql = "SELECT * FROM houses WHERE id = #{@house_id}"
  #   houses_array = SqlRunner.run(sql)
  #   found_houses = houses_array.map { |house| House.new(house) }
  #   return found_houses[0]
  # end

  # def Student.find(id)
  #   sql = "SELECT * FROM students WHERE id=#{id};"
  #   student = SqlRunner.run( sql )[0]
  #   return Student.new( student )
  # end

  # def Student.delete_all 
  #   sql = "DELETE FROM students;"
  #   SqlRunner.run(sql)
  #   return nil
  # end

  # def Student.find_all
  #   sql = "SELECT * FROM students"
  #   student_array = SqlRunner.run(sql)
  #   students = student_array.map { |student| Student.new(student)}
  #   return students
  # end

end