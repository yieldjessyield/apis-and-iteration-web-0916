#require 'pry'
def welcome
  puts "HELLO SPACE TRAVERLER!!"
end

def get_character_from_user
  puts "please enter a character"
  gets.chomp.downcase
#binding.pry
  # use gets to capture the user's input. This method should return that input, downcased.
end

#get_character_from_user
