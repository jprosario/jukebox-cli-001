#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

require 'pry'

# my_songs = {
# "Go Go GO" => 'Users/jomar/Development/code/jukebox-cli/audio/Emerald-Park/01.mp3',
# "LiberTeens" => 'Users/jomar/Development/code/jukebox-cli/audio/Emerald-Park/02.mp3',
# "Hamburg" =>  'Users/jomar/Development/code/jukebox-cli/audio/Emerald-Park/03.mp3',
# "Guiding Light" => 'Users/jomar/Development/code/jukebox-cli/audio/Emerald-Park/04.mp3',
# "Wolf" => 'Users/jomar/Development/code/jukebox-cli/audio/Emerald-Park/05.mp3',
# "Blue" => 'Users/jomar/Development/code/jukebox-cli/audio/Emerald-Park/06.mp3',
# "Graduation Failed" => 'Users/jomar/Development/code/jukebox-cli/audio/Emerald-Park/07.mp3'
# }

def help
  #this method should be the same as in jukebox.rb
  puts 'I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program'
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and 
  #list the songs by name
  my_songs.map do |name, path|
    puts "#{name}"
    name
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name:"
  response = gets.chomp
  output = 'Invalid input, please try again'
  my_songs.each do |name, path|
    if response == name
      #binding.pry
      output = "Playing #{name}"
      system "open #{path}"
    end
  end
  puts output
end

def exit_jukebox
  #this method is the same as in jukebox.rb
  puts 'Goodbye'
end

def enter_command
  puts 'Please enter a command:'
  return gets.chomp
end

def run(my_songs)
  #this method is the same as in jukebox.rb
  help
  command = enter_command
  while command != 'exit'
    case command
    when 'help'
      help
      command = enter_command
    when 'list'
      list(my_songs)
      command = enter_command
    when 'play'
      play(my_songs)
      command = enter_command
    else
      puts 'Invalid input, please try again'
      command = enter_command
    end
  end
  exit_jukebox
end
