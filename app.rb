require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('./lib/actor')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "music_festival"})

get('/') do
  @stages = Stage.all
  erb(:stages)
end

get('/stages') do
  @stages = Stage.all
  erb(:stages)
end

get('/stages/new') do
  erb(:new_stage)
end

post('/stages') do
  name = params[:stage_name]
  stage = Stage.new(name, nil)
  stage.save()
  @stages = Stage.all()
  erb(:stages)
end

get('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end

get('/stages/:id/edit') do 
  @stage = Stage.find(params[:id].to_i())
  erb(:edit_stage)
end

patch('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.update(params[:name])
  @stages = Stage.all
  erb(:stages)
end

delete('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end