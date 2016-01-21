require 'sinatra'


get '/' do
	erb :form
end


get '/:birthday' do
	setup_index_view
end

get '/message/:number' do
   number = params[:number].to_i
   @message = Person.display_message(number)
   erb :index
end

post '/' do
  birthday = params[:birthday].gsub("-", "")
  if Person.valid_birthdate(birthday)
    number = Person.determine_birth_number(birthday)
    redirect "/message/#{number}"
  else
    @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
    erb :form
  end
end

def setup_index_view
	birthday = params[:birthday]
	number = Person.determine_birth_number(birthday)
	@message = Person.display_message(number)
	erb :index
end
