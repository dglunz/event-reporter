class CLI
  attr_reader :commands,
              :printer,
              :out

  def initialize
    @commands = ""
    @printer  = Printer.new
    @out      = $stdout
  end

  def start_menu
    #will only output last evaluated string
    out.puts printer.welcome_message
    until quit?
      out.printf printer.command_prompt
      @commands = gets.strip.downcase
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
      out.puts printer.invalid_command(commands.first)
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
    commands == "q" || commands == "quit"
  end

  def help?
    commands == 'h' || commands == "help"
  end

  def multiple_commands?
    commands.length > 1
  end

end

# require_relative 'printer'
#
# cli = CLI.new
# # cli.process("load event_attendees.csv")
# cli.process("help queue save to")
