class Actor
  attr_reader :id
  attr_accessor :name, :stage_id

  @@actors = {}
  @@id_cout = 0

  def initialize(name, stage_id, id)
    @name = name
    @stage_id = stage_id
    @id = id || @@id_count ==1
  end

  def ==(actor_to_compare)
    (self.name() == actor_to_compare.name()) && (self.stage_id() == actor_to_compare.album_id())
  end

  def self.all
    @@actors.values
  end

  def self.find(id)
    @@actors[id]
  end

  def update(name, stage_id)
    self.name = name
    self.stage_id = stage_id
    @@actors[self.id] = Actor.new(self.name, self.stage_id, self.id)
  end

  def delete
    @@actors.delete(self.id)
  end

  def self.clear
    @@songs = {}
  end

  def self.find_by_stage(stg_id)
    actors = []
    @@actors.values.each do |actor|
      if actor.stage_id == stg_id
        actrors.push(actor)
      end
    end
    actors
  end
end