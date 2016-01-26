class Person < ActiveRecord::Base
  validates_presence_of :birthday, :first_name, :last_name
  def self.determine_birth_number(birthday)
  number = birthday[0].to_i + birthday[1].to_i + birthday[2].to_i + birthday[3].to_i + birthday[4].to_i + birthday[5].to_i + birthday[6].to_i + birthday[7].to_i

    number = number.to_s #because array syntax is a string
    number = number[0].to_i + number[1].to_i

    if number > 9
      number = number.to_s
      number = number[0].to_i + number[1].to_i
    end

    return number
  end

  def self.display_message(number)

  case number
  when 1
    message = "Your numerology number is #{number}.\nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
  when 2
      message = "Your numerology number is #{number}.\nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
  when 3
      message = "Your numerology number is #{number}.\nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
  when 4
      message = "Your numerology number is #{number}.\nThis is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
  when 5
      message = "Your numerology number is #{number}.\nThis is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
  when 6
      message = "Your numerology number is #{number}.\nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
  when 7
      message = "Your numerology number is #{number}.\nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
  when 8
      message = "Your numerology number is #{number}.\nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
  when 9
      message = "Your numerology number is #{number}.\nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
  else
      message = "Uh oh! Your birth path number is not 1-9!"
  end
  end


def self.valid_birthdate(input)
	if(input.length == 8 && !input.match(/^[0-9]+[0-9]$/).nil?)
		true
	else
		false
	end
end
end
