class Stage 
  attr_reader :id, :name
  @@stages = {}
  @@id_count = 0

  def initialize(name, id)
    @name = name
    @id = id || @@id_count +=1
  end

  def self.all
    @@stages.values()
  end

  def ==(stage_to_compare)
    self.name == stage_to_compare.name()
  end

  def save
    @@stages[self.id] = Stage.new(self.name, self.id)
  end

  def self.clear
    @@stages = {}
    @@id_count = 0
  end

  def self.find(id)
    @@stages[id]
  end

  def update(name)
    @name = name
  end

  def delete 
    @@stages.delete(self.id)
  end
end