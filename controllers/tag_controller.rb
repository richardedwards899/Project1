require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')
require_relative( '../models/Transaction.rb' )
require_relative( '../models/Tag.rb' )
require_relative( '../models/Person.rb' )

#route 1 - show all tags
get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

#route 3 - offer blank fields
get '/tags/new' do
  erb(:"tags/new")
end

#route 4 - create a new tag
post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to '/tags'
end

#route 5 - edit a tag on screen
get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])
  erb(:"tags/edit")
end

#route 6 - update our edited tag to the database
post '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to '/tags'
end