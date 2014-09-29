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

  def help_commands
    puts "To access help instructions type Help <command name>:"
    puts "Available commands: \nqueue: \n\tqueue count \n\tqueue clear \n\tqueue print \n\tqueue print by\n\tqueue save"
    puts "\nload: \nno sub-commands"
    puts "\nfind: \nno sub-commands"
  end

  def help_queue
  end

  def help_queue_count
  end

  def help_queue_clear
  end

  def help_queue_print
  end

  def help_queue_print_by
  end

  def help_queue_save
  end

  def help_queue_load
  end

  def help_find
  end
end
