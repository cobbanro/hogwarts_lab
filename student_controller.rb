require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/student')
require_relative('./models/house')
also_reload('.models/*')

get '/student' do
  @students = Student.all()
  erb(:all)
end

get '/student/new' do
  @houses = House.all()
  erb(:new)
end

post '/student' do
  student1 = Student.new(params)
  student1.save()
  redirect to('/student')
end
