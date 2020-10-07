class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(array)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  
  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type) 
    VALUES (?,?)
    SQL
    db.execute(sql, name, type)
  end
  
  
  def self.find(id, name, type)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE students.id = ?
    SQL
    pokemon = self.new(row[0], row[1],row[2])
    pokemon
  end 
end
