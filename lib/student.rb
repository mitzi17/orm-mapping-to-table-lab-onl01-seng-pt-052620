class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn] 
  
  attr_accessor :name, :grade
  attr_reader :id
  
  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end
  
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end
  
  def save
    sql = <<-SQL
      INSERT INTO (name, grade)
      VALUES (?, ?)
      SQL
      
      DB[:conn].execute(sql, self.name, self.grade)
  end
    
  
end
