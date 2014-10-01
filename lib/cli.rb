class CLI
  attr_reader :commands,
              :printer,
              :out,
              :repository

  def initialize(out=$stdout)
    @commands = []
    @printer  = Printer.new
    @out      = out
  end

  def start_menu
    welcome_message
    until quit?
      get_commands
      process(commands)
    end
  end

  def process(input)
    @commands = input #.split(" ")
    @commands = commands.split(" ")

    argument = commands[1..-1]

    case commands.first
    when "load"
      load(argument.last)
    when "queue"
      queue(argument)
    when "find"
      find(argument)
    when "help"
      multiple_commands? ? help(argument) : (out.puts printer.help)
    else
      invalid_command
    end
  end

  def load(path="event_attendees.csv")
    csv = Loader.new(path)
    @repository = Repository.new(csv.attendees)
  end

  def find(argument)
    attribute = argument.first
    criteria = argument[1..-1].join(" ")
    repository.find_by(attribute, criteria)
  end

  def queue(argument)
    case argument.first
    when "print"
      multiple_commands? ? print_by(argument) : repository.queue_print
    when "count"
      out.puts repository.queue_count
    when "clear"
      repository.queue_clear
    when "save"
      file_name = argument.last
      Saver.new.save_file(repository.queue, file_name)
    end
  end

  def print_by(argument)
    attribute = argument.last
    repository.sort_by(attribute)
    repository.queue_print
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
    else
      invalid_command
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
      multiple_commands? ? invalid_command : (out.puts printer.help)
    end
  end

  def quit?
    commands.first == "q" || commands.first == "quit"
  end

  def help?
    commands.first == 'h' || commands.first == "help"
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
