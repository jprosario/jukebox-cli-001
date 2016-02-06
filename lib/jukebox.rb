require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts 'I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program'
end

def list(songs)
  songs.each_with_index do |name, num|
    puts "#{num + 1}. #{name}"
  end
end

def play(songs)
  puts "Please enter a song name or number:"
  response = gets.chomp
  output = 'Invalid input, please try again'
  songs.each_with_index do |name, num|
    if response.to_i == num.to_i + 1 or response == name
      output = "Playing #{name}"
    end
  end
  puts output
end

def exit_jukebox
  puts 'Goodbye'
end

def enter_command
  puts 'Please enter a command:'
  return gets.chomp
end

def run(songs)
  help
  command = enter_command
  while command != 'exit'
    case command
    when 'help'
      help
      command = enter_command
    when 'list'
      list(songs)
      command = enter_command
    when 'play'
      play(songs)
      command = enter_command
    end
  end
  exit_jukebox
end