require 'sinatra'





#puts "Please enter your birthday in a MMDDYYYY format."
#birthday = gets

#number = determine_birth_number(birthday)

#message = display_message(number)

#puts message

get '/' do
	erb :form
end

def setup_index_view
	birthday = params[:birthday]
	number = Person.determine_birth_number(birthday)
	@message = display_message(number)
	erb :index
end

get '/:birthday' do
	setup_index_view
end

get '/message/:number' do
   number = params[:number].to_i
   @message = display_message(number)
   erb :index
end



post '/' do
  birthday = params[:birthday].gsub("-", "")
  if valid_birthdate(birthday)
    number = Person.determine_birth_number(birthday)
    redirect "/message/#{number}"
  else
    @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
    erb :form
  end
end



def valid_birthdate(input)
	if(input.length == 8 && !input.match(/^[0-9]+[0-9]$/).nil?)
		true
	else
		false
	end
end
