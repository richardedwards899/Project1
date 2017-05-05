require_relative('../db/sql_runner.rb')

class Transaction

  attr_accessor :person_id, :tag_id, :merchant, :value, :purchased_on
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @person_id = params['person_id'].to_i
    @tag_id = params['tag_id'].to_i
    @merchant = params['merchant']
    @value = params['value'].to_i
    @purchased_on = params['purchased_on']
  end

  def save
    sql = "
    INSERT INTO transactions 
    ( person_id, tag_id, merchant, value, purchased_on ) VALUES 
    ( #{@person_id}, #{@tag_id}, '#{@merchant}', #{@value}, '#{@purchased_on}' ) 
    RETURNING id;"

    @id = SqlRunner.run(sql)[0]['id'].to_i
    return nil
  end  

  def update()
    sql = "UPDATE transactions SET 
    ( person_id, tag_id, merchant, value, purchased_on ) = 
    ( #{@person_id}, #{@tag_id}, '#{@merchant}', #{@value}, '#{@purchased_on}' ) WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  def delete()
    sql = "DELETE FROM transactions where id = #{@id};"
    SqlRunner.run(sql)
  end

  def Transaction.all()
    sql = "SELECT * FROM transactions;"
    transaction_hashes = SqlRunner.run(sql)
    return transaction_hashes.map { |transaction_hash| Transaction.new(transaction_hash) }
  end

  def Transaction.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
    return nil
  end

  def Transaction.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id};"
    return Transaction.new ( SqlRunner.run(sql)[0] )
  end
end