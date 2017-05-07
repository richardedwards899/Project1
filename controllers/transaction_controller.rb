require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')
require_relative( '../models/Transaction.rb' )
require_relative( '../models/Tag.rb' )
require_relative( '../models/Person.rb' )

#route 1 - show all transactions
get '/transactions' do
  @transactions = Transaction.all()
  @total_spent = Transaction.total_spent
  @tags = Tag.all()
  @person = Person.all.first()
  erb ( :"transactions/index" )
end

#route 3 - offer blank fields
get '/transactions/new' do
  @person = Person.all.first()
  @tags = Tag.all()
  erb(:"transactions/new")
end

#route 4 - create a new transaction
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to '/transactions'
end

#route 5 - edit a transaction on screen
get '/transactions/:id/edit' do
  @person = Person.all.first()
  @transaction = Transaction.find(params[:id])
  @tags = Tag.all()
  erb(:"transactions/edit")
end

#route 6 - update our edited transaction to the database
post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to 'transactions'
end

#route 7 - delete a transaction
post '/transactions/:id/delete' do
  transaction = Transaction.find(params[:id])
  transaction.delete
  redirect to 'transactions'
end