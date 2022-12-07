# require_relative 'app'

# @app = App.new

def menu
  clear_terminal
  print 'Welcome to your catalog of things! Please choose one of the following actions:
    1. Let\'s welcome our visitor
    2. Exit
    Your choice: '
end

def process_input
  case gets.chomp.to_i
  when 1
    puts 'Welcome, visitor!'
  when 2
    puts 'I bid you farewell!'
    pause
    clear_terminal
    exit(true)
  else
    puts 'I don\'t know how to handle your choise. Try choosing again!'
  end
  pause
end

def pause(time = 2)
  sleep time
end

def clear_terminal
  system 'clear'
end

def main(status)
  loop do
    break unless status

    menu
    process_input
  end
end

main(true)
