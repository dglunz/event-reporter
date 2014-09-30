class CLI
  attr_reader :commands,
              :printer,
              :out

  def initialize
    @commands = []
    @printer  = Printer.new
    @out      = $stdout
  end

  def start_menu
    welcome_message
    until quit?
      get_commands
      process(commands)
    end
  end

  def process(input)
    @commands = input
    @commands = commands.split(" ")

    argument = commands[1..-1]

    case commands.first
    when "load"
      load(argument)
    when "queue"
      queue(argument)
    when "find"
      find(argument)
    when "help"
      if multiple_commands?
        help(argument)
      else
        out.puts printer.help
      end
    else
      invalid_command
    end
  end

  def help(commands)
    argument = commands[1..-1].join(" ")

    case commands.first
    when "load"
      out.puts printer.help_load
    when "queue"
      queue_help(argument)
    when "find"
      out.puts printer.help_find
    end

  end

  def queue_help(additional)
    case additional
    when "count"
      out.puts printer.help_queue_count
    when "clear"
      out.puts printer.help_queue_clear
    when "print"
      out.puts printer.help_queue_print
    when "print by"
      out.puts printer.help_queue_print_by
    when "save to"
      out.puts printer.help_queue_save_to
    else
      out.puts printer.invalid_command(commands)
    end
  end

  def quit?
    commands.first == "q" || commands.first == "quit"
  end

  def help?
    commands == 'h' || commands == "help"
  end

  def multiple_commands?
    commands.length > 1
  end

  def get_commands
    out.printf printer.command_prompt
    @commands = gets.strip.downcase
  end

  def welcome_message
    out.print printer.clear_screen
    out.puts printer.welcome_message
    out.puts printer.start_commands
  end

  def invalid_command
    invalid = commands.join(" ")
    quit? ? (out.puts printer.quit) : (out.puts printer.invalid_command(invalid))
  end

end

# require_relative 'printer'
#
# cli = CLI.new
# # cli.process("load event_attendees.csv")
# cli.process("help queue save to")
