require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require_relative('controllers/person_controller.rb')
require_relative('controllers/tag_controller.rb')
require_relative('controllers/transaction_controller.rb')

get '/' do
  @months = Transaction.months()
  @monthly_totals = Transaction.monthly_expenditures()
  @total_spent = Transaction.total_spent
  @tags = Tag.all()
  erb( :index )
end

