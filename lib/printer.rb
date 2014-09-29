class Printer

  def welcome_message
    puts "Welcome to Event Reporter."
    start_commands
  end

  def start_commands
    puts "\n(q)uit to exit\n(h)elp to list available commands"
    command_prompt
  end

  def command_prompt
    "Enter your command:"
  end

  def help
    puts "To access help instructions type Help <command name>:"
    puts "Available commands: \nqueue: \n\tqueue count \n\tqueue clear \n\tqueue print \n\tqueue print by\n\tqueue save to"
    puts "\nload: \nno sub-commands"
    puts "\nfind: \nno sub-commands"
  end

  def help_load
    puts "load <filename> \n Erases any loaded data and parses the specified file. If no filename is given, default loads to event_attendees.csv"
  end

  def help_queue_count
    puts "HIT"
  end

  def help_queue_clear
    puts "HIT"
  end

  def help_queue_print
    puts "HIT"
  end

  def help_queue_print_by
    puts "HIT"
  end

  def help_queue_save_to
    puts "HIT"
  end

  def help_queue_load
    puts "HIT"
  end

  def help_find
    puts "HIT"
  end

end
