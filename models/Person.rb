require_relative('../db/sql_runner.rb')

class Person

  attr_accessor :first_name, :last_name, :budget
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @budget = params['budget'].to_i
  end

  def save
    sql = "INSERT INTO people ( first_name, last_name, budget ) VALUES ( '#{@first_name}', '#{@last_name}', #{@budget} ) RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
    return nil
  end  

  def update()
    sql = "UPDATE people SET ( first_name, last_name, budget ) = ( '#{@first_name}', '#{@last_name}', #{@budget} ) WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  def delete()
    sql = "DELETE FROM people where id = #{@id};"
    SqlRunner.run(sql)
  end

  def Person.all()
    sql = "SELECT * FROM people;"
    people_hashes = SqlRunner.run(sql)
    return people_hashes.map { |person_hash| Person.new(person_hash) }
  end

  def Person.delete_all()
    sql = "DELETE FROM people;"
    SqlRunner.run(sql)
    return nil
  end

  def Person.find(id)
    sql = "SELECT * FROM people WHERE id = #{id};"
    return Person.new ( SqlRunner.run(sql)[0] )
  end
end