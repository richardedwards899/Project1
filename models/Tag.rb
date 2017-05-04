require_relative('../db/sql_runner.rb')

class Tag

  attr_accessor :tag_name
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @tag_name = params['tag_name']
  end

  def save
    sql = "INSERT INTO tags ( tag_name ) VALUES ( '#{@tag_name}' ) RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
    return nil
  end  

  def update()
    sql = "UPDATE tags SET ( tag_name ) = ( '#{@tag_name}' ) WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  def delete()
    sql = "DELETE FROM tags where id = #{@id};"
    SqlRunner.run(sql)
  end

  def Tag.all()
    sql = "SELECT * FROM tags;"
    tag_hashes = SqlRunner.run(sql)
    return tag_hashes.map { |tag_hash| Tag.new(tag_hash) }
  end

  def Tag.delete_all()
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)
    return nil
  end

  def Tag.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id};"
    return Tag.new ( SqlRunner.run(sql)[0] )
  end
end