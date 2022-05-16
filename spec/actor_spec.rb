require 'spec_helper'

describe '#Actor' do

  before(:each) do
    @stage = Stage.new({:name => "blue", :id => nil})
    @stage.save()
  end

  describe('#==') do
    it("is the same actor if it has the same attributes as another actor") do
      actor = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      actor2 = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      expect(actor).to(eq(actor2))
    end
  end

  describe('.all') do
    it("returns a list of all actor") do
      actor = Actor.new({:name => "Giant Steps", :stage_id => @stage.id, :id => nil})
      actor.save
      actor2 = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      actor2.save
      expect(Actor.all).to(eq([actor, actor2]))
    end
  end

  describe('.clear') do
    it("clears all actor") do
      actor = Actor.new({:name => "Giant Steps", :stage_id => @stage.id, :id => nil})
      actor.save()
      actor2 = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      actor2.save()
      Actor.clear()
      expect(Actor.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a actor") do
      actor = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      actor.save()
      expect(Actor.all).to(eq([actor]))
    end
  end

  describe('.find') do
    it("finds a actor by id") do
      actor = Actor.new({:name => "Giant Steps", :stage_id => @stage.id, :id => nil})
      actor.save()
      actor2 = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      actor2.save()
      expect(Actor.find(actor.id)).to(eq(actor))
    end
  end

  describe('#update') do
    it("updates an acotr by id") do
      actor = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      actor.save()
      actor.update("Mr. P.C.", @stage.id)
      expect(actor.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an actor by id") do
      actor = Actor.new({:name => "Giant Steps", :stage_id => @stage.id, :id => nil})
      actor.save()
      actor2 = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      actor2.save()
      actor.delete()
      expect(Actor.all).to(eq([actor2]))
    end
  end

  describe('.find_by_stage') do
    it('finds songs for an stage') do
      stage2 = Stage.new({:name => "blue", :id => nil})
      stage2.save
      actor = Actor.new({:name => "Naima", :stage_id => @stage.id, :id => nil})
      actor.save
      actor2= Actor.new({:name => "california", :stage_id => stage2.id, :id => nil})
      actor2.save()
      expect(Actor.find_by_stage(stage2.id)).to(eq([actor2]))
    end
  end
end