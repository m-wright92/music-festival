class Actor
  attr_reader :id
  attr_accessor :name, :stage_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @stage_id = attributes.fetch(:stage_id)
    @id = attributes.fetch(:id)
  end

  def ==(actor_to_compare)
    if actor_to_compare != nil
      (self.name() == actor_to_compare.name()) && (self.stage_id() == actor_to_compare.stage_id())
    else
      false
    end
  end

  def self.all
    returned_actors = DB.exec("SELECT * FROM actors;")
    actors = []
    returned_actors.each do |actor|
      name = actor.fetch("name")
      stage_id = actor.fetch("stage_id").to_i
      id = actor.fetch("id").to_i
      actors.push(Actor.new({:name => name, :stage_id => stage_id, :id => id}))
    end
    actors
  end

  def self.find(id)
    actor = DB.exec("SELECT * FROM actors WHERE id = #{id};").first
    name = actor.fetch("name")
    stage_id = actor.fetch("stage_id").to_i
    id = actor.fetch("id").to_i
    Actor.new({:name => name, :stage_id => stage_id, :id => id})
  end

  def update(name, stage_id)
    @name = name
    @stage_id = stage_id
    DB.exec("UPDATE actors SET name = '#{@name}', stage_id = #{@stage_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM actors WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM actors *;")
  end

  def self.find_by_stage(stage_id)
    actors = []
    returned_actors = DB.exec("SELECT * FROM actors WHERE stage_id = #{stage_id};")
    returned_actors.each do |actor|
      name = actor.fetch("name")
      stage_id = actor.fetch("stage_id").to_i
      id = actor.fetch("id").to_i
      actors.push(Actor.new({:name => name, :stage_id => stage_id, :id => id}))
    end
    actors
  end

  def stage
    Stage.find(self.stage_id)
  end

  def save 
    result = DB.exec("INSERT INTO actors (name, stage_id) VALUES ('#{@name}', #{@stage_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end
end