get '/people' do
  @people = Person.all
  erb :"/people/index"
end

get '/people/new' do
  @person = Person.new
  erb :"/people/new"
end

post '/people' do
  if params[:birthday].include?("-")
    birthday = params[:birthday]
  else
    birthday = Date.strptime(params[:birthday], "%m%d%y")
  end

  @person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthday: params[:birthday])
  if @person.valid?
    @person.save
  redirect "/people/#{@person.id}"
else
  @person.errors.full_messages.each do |message|
    @errors= "#{@errors} #{message}"
  end
    erb :"/people/new"
  end

end

get '/people/:id' do
  @person = Person.find(params[:id])
  birthday_string = @person.birthday.strftime("%m%d%y")
  number = Person.determine_birth_number(birthday_string)
  @message = Person.display_message(number)
  erb :"/people/show"
end

get '/people/:id/edit' do
  @person = Person.find(params[:id])
  erb :'/people/edit'
end

put '/people/:id' do
  @person = Person.find(params[:id])
  @person.first_name = params[:first_name]
  @person.last_name = params[:last_name]
  @person.birthday = params[:birthday]
  if @person.valid?
    @person.save
  redirect "/people/#{@person.id}"
else
  @person.errors.full_messages.each do |message|
    @errors= "#{@errors} #{message}"
end
  erb :"people/edit"
end
end

delete '/people/:id' do
  @person = Person.find(params[:id]) #class variables?
  @person.delete
  redirect "/people"
end
