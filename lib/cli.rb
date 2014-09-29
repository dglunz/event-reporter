class CLI
  attr_reader :command

  def initialize
    @command = ""
  end

  def start_menu
    puts "Welcome to Event Reporter"
    puts "(q)uit to exit\n(h)elp to list available commands"
    puts "Enter your command:"
    until quit?
      process_main_menu
      @command = gets.strip.downcase
    end
  end

  def process_main_menu
    case
    when help?
      print_help_menu
      process_help_menu
    end
  end

  def print_help_menu
    puts "To access help instructions type Help <command name>:" 
    puts "Available commands: \nqueue: \n\tqueue count \n\tqueue clear \n\tqueue print \n\tqueue print by\n\tqueue save"
    puts "\nload: \nno sub-commands"
    puts "\nfind: \nno sub-commands"
  end

  def process_help_menu
    case
    when help_queue?
    when help_queue_count?
    when help_queue_clear?
    when help_queue_print
    when help_queue_print_by?
    when help_queue_save?
    when help_load
    when help_find
  end

  def quit?
    command == "q" || command == "quit"
  end

  def help?
    command == 'h' || command == "help"
  end

  def help_queue?
    command == 'help queue'
  end

  def help_queue_count?
    command == 'help queue count'
  end

  def help_queue_clear?
    command == 'help queue clear'
  end

  def help_queue_print?
    command == 'help queue print'
  end

  def help_queue_print_by?
    command == 'help queue print by'
  end

  def help_queue_save?
    command == 'help queue save'
  end

  def help_load
    command == "help load"
  end

  def help_find
    help_find
  end
end