require('date')
require_relative('../db/sql_runner.rb')
require_relative('../models/Tag.rb')

class Transaction

  attr_accessor :person_id, :tag_id, :merchant, :value, :purchased_on
  attr_reader :id, :month_year

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @person_id = params['person_id'].to_i
    @tag_id = params['tag_id'].to_i
    @merchant = params['merchant']
    @value = params['value'].to_f
    @purchased_on = Date.parse(params['purchased_on'])
    @purchased_during_month = Date.new(@purchased_on.year, @purchased_on.month, -1)
  end

  def save
    sql = "
    INSERT INTO transactions 
    ( person_id, tag_id, merchant, value, purchased_on, purchased_during_month ) VALUES 
    ( #{@person_id}, #{@tag_id}, '#{@merchant}', #{@value}, '#{@purchased_on.to_s}', '#{@purchased_during_month.to_s}') 
    RETURNING id;"

    @id = SqlRunner.run(sql)[0]['id'].to_i
    return nil
  end  

  def update()
    sql = "UPDATE transactions SET 
    ( person_id, tag_id, merchant, value, purchased_on, purchased_during_month ) = 
    ( #{@person_id}, #{@tag_id}, '#{@merchant}', #{@value}, '#{@purchased_on}', '#{@purchased_during_month.to_s}' ) 
    WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  def delete()
    sql = "DELETE FROM transactions where id = #{@id};"
    SqlRunner.run(sql)
  end

  def category
    sql =
    "SELECT * FROM tags
    WHERE tags.id = #{@tag_id};"
    tag_hash = SqlRunner.run(sql)[0]
    return Tag.new(tag_hash) 
  end

  # returns an array of months for which there are transactions
  def Transaction.months
    monthly_totals_array = self.expenditure_totals_by_month
    result_array = []

    monthly_totals_array.each() { |result|
      result_array << result['purchased_during_month'] 
    }
    return result_array
  end

  # returns an array of total expenditures corresponding with the month
  def Transaction.monthly_expenditures
    monthly_totals_array = self.expenditure_totals_by_month
    result_array = []

    monthly_totals_array.each() { |result|
      result_array << result['sum'].to_f
    }
    return result_array
  end

  def Transaction.total_spent
    sql = "SELECT SUM (value) FROM transactions;"
    return SqlRunner.run(sql)[0]['sum'].to_f
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

  private

  def Transaction.expenditure_totals_by_month
    sql = "
    SELECT purchased_during_month, SUM(value) 
    FROM transactions 
    GROUP BY purchased_during_month 
    ORDER BY purchased_during_month DESC;"
    return SqlRunner.run(sql)
  end

end