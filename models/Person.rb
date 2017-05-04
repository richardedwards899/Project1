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
    return nil
  end  

  def update()
    sql = "UPDATE people SET ( first_name, last_name, budget ) = ( '#{@first_name}', '#{@last_name}', #{@budget} ) WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  # def delete()
  #   sql = "DELETE FROM customers where id = #{@id};"
  #   SqlRunner.run(sql)
  # end

  # def Customer.all()
  #   sql = "SELECT * FROM customers;"
  #   customer_hashes = SqlRunner.run(sql)
  #   return customer_hashes.map { |customer_hash| Customer.new(customer_hash) }
  # end

  # def Customer.delete_all()
  #   sql = "DELETE FROM customers;"
  #   SqlRunner.run(sql)
  # end

  # def Customer.find(id)
  #   sql = "SELECT * FROM customers WHERE id = #{id};"
  #   return Customer.new ( SqlRunner.run(sql)[0] )
  # end
end