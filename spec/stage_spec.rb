require 'rspec'
require 'stage'
require 'actor'

describe('#Stage') do
  
  before(:each) do
    Stage.clear
  end

  describe('.all') do
    it("returns an empty array when there are no stages") do
      expect(Stage.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same stage if it has the same atrtributes as another stage') do
      stage = Stage.new("stage1", nil)
      stage2 = Stage.new("stage1", nil)
      expect(stage).to(eq(stage2))
    end
  end

  describe('#save') do
    it("saves a stage") do
      stage = Stage.new("stage1", nil)
      stage.save()
      stage2 = Stage.new("stage2", nil)
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end

  describe('.clear') do
    it('clears all stages') do
      stage = Stage.new('stage1', nil)
      stage.save()
      stage2 = Stage.new("stage2", nil)
      stage2.save()
      Stage.clear
      expect(Stage.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a stage by id') do
      stage = Stage.new('stage1', nil)
      stage.save()
      stage2 = Stage.new('stage2', nil)
      stage2.save()
      expect(Stage.find(stage.id)).to(eq(stage))
    end
  end

  describe('#update') do
    it("updates a stage by id") do
      stage = Stage.new("stage1", nil)
      stage.save()
      stage.update("stage7")
      expect(stage.name).to(eq("stage7"))
    end
  end

  describe("#delete") do
    it("deletes a stage by id") do
      stage = Stage.new("stage1", nil)
      stage.save()
      stage2 = Stage.new("stage2", nil)
      stage2.save
      stage2.delete
      expect(Stage.all).to(eq([stage]))
    end
  end
end