class Processor
  attr_reader :printer,
              :out,
              :repository,
              :commands,
              :argument,
              :attribute,
              :criteria

  def initialize(printer, out)
    @repository = Repository.new
    @printer    = printer
    @out        = out.puts
    @commands   = []
    @parser     = Parser.new
  end

  def process(input)
    # @commands = parser.parse(input)
    
    @executor = Executor.new(commands, argument, attribute, criteria)

    case commands.first
    when "load"     then executor.load_file(attribute)
    when "queue"    then queue
    when "find"     then executor.find
    when "help"     then help
    when "subtract" then executor.subtract
    when "add"      then executor.add
    else
      invalid_command
    end
  end

  def queue
    case attribute
    when "print" then executor.print_by
    when "count" then executor.count
    when "clear" then executor.clear
    when "save"  then executor.save
    end
  end

  def help
    case attribute
    when "load"  then out printer.help_load
    when "find"  then out printer.help_find
    when "queue" then queue_help
    else
      invalid_command
    end
  end

  def queue_help
    case argument.last
    when "count" then out printer.help_queue_count
    when "clear" then out printer.help_queue_clear
    when "print" then out printer.help_queue_print
    when "by"    then out printer.help_queue_print_by
    when "to"    then out printer.help_queue_save_to
    else
      invalid_command
    end
  end

  def multiple_commands?
    commands.length > 1
  end

  def invalid_command
    invalid = commands.join(" ")
    quit? ? (out printer.quit) : (out printer.invalid_command(invalid))
  end

  def quit?
    commands.first == 'quit' || commands.first == 'q' || commands.first == 'exit'
  end

end
