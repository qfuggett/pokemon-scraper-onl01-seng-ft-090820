class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
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
  
  
  def self.find(name, type)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE pokemon.id = ?
    SQL
    pokemon = db.execute(sql, id).flatten
    self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db)
  end 
end
