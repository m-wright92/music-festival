class Stage 
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_stages = DB.exec("select * FROM stages;")
    stages = []
    returned_stages.each() do |stage|
      name = stage.fetch("name")
      id = stage.fetch("id").to_i
      stages.push(Stage.new({:name => name, :id => id}))
    end
    stages
  end

  def ==(stage_to_compare)
    self.name == stage_to_compare.name()
  end

  def save
    result = DB.exec("INSERT INTO stages (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM stages *;")
  end

  def self.find(id)
    stage = DB.exec("SELECT * FROM stages WHERE id = #{id};").first
    name = stage.fetch("name")
    id = stage.fetch("id").to_i
    Stage.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE stages SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete 
    DB.exec("DELETE FROM stages WHERE id = #{@id};")
  end

  def actor
    Actor.find_by_stage(self.id)
  end
end