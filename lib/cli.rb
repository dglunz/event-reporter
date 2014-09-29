class CLI
  attr_reader :command, :printer

  def initialize
    @command = ""
    @printer = Printer.new
  end

  def start_menu
    printer.welcome_message
    until quit?
      @command = gets.strip.downcase
      printer.command_prompt
      process(command)
    end
  end

  def process(command)
    commands = command.split(" ")

    if commands.length > 1
      method = commands[0]
      argument = commands[1..-1].join(" ")
    else
      method = command
    end

    case method
    when "load"
      load(argument)
    when "queue"
      queue(argument)
    when "find"
      find(argument)
    when "help"
      if commands.length > 1
        help(argument)
      else
        printer.help
      end
    end

  end

  def help(command)
    commands = command.split(" ")
    method = commands[0]
    argument = commands[1..-1].join(" ")

    case method
    when "load"
      printer.help_load
    when "queue"
      queue_help(argument)
    when "find"
      printer.help_find
    end

  end

  def queue_help(additional)
    case additional
    when "count"
      printer.help_queue_count
    when "clear"
      printer.help_queue_clear
    when "print"
      printer.help_queue_print
    when "print by"
      printer.help_queue_print_by
    when "save to"
      printer.help_queue_save_to
    else
      printer.help
    end
  end

  def quit?
    command == "q" || command == "quit"
  end

  def help?
    command == 'h' || command == "help"
  end

end

require_relative 'printer'

cli = CLI.new
# cli.process("load event_attendees.csv")
cli.process("help queue save to")
