require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')
require_relative( '../models/Transaction.rb' )
require_relative( '../models/Tag.rb' )


#route 1 - show all transactions
get '/transactions' do
  @transactions = Transaction.all()
  @total_spent = Transaction.total_spent
  @tags = Tag.all()
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @tags = Tag.all()
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to '/transactions'
end