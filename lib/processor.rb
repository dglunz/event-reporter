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
    @out        = out
    @commands   = []
  end

  def process(input)
    @commands = input.strip.downcase.split(" ")
    if multiple_commands?
      @argument = commands[1..-1]
      @attribute = argument.first
      @criteria = argument[1..-1].join(" ")
    end

    case commands.first
    when "load"     then multiple_commands? ? load_file(argument.last) : load_file
    when "queue"    then queue
    when "find"     then valid_attribute?(attribute) ? find : invalid_command
    when "help"     then multiple_commands? ? help : (out.puts printer.help)
    when "subtract" then subtract
    when "add"      then add
    else
      invalid_command
    end
  end

  def load_file(path="event_attendees.csv")
    if File.exist?("./data/#{path}")
      csv = Loader.new(path)
      @repository = Repository.new(csv.attendees)
      out.puts printer.file_loaded
    else
      out.puts printer.file_not_found
    end
  end

  def find
    if single_find_criteria?
      repository.find_by(attribute, criteria)
    else
      repository.find_by(attribute, parse_criteria)
      repository.narrow_results_by(parse_attribute, parse_second_criteria)
    end
    out.puts printer.queue_loaded
  end

  def valid_attribute?(attribute)
    Entry.instance_methods.include?(attribute.to_sym)
  end

  def predicate_index
    argument.index("and")
  end

  def parse_attribute
    attribute_index = predicate_index + 1
    argument[attribute_index]
  end

  def parse_second_criteria
    argument[predicate_index + 2..-1].join(" ")
  end

  def parse_criteria
    criteria_end = predicate_index - 1
    argument[1..criteria_end].join(" ")
  end

  def single_find_criteria?
    argument.none? { |word| word == "and" }
  end

  def subtract
    repository.subtract_results_by(attribute, criteria)
    out.puts printer.queue_updated
  end

  def add
    repository.add_results_by(attribute, criteria)
    out.puts printer.queue_updated
  end

  def queue
    case attribute
    when "print" then multiple_commands? ? print_by : repository.queue_print
    when "count" then out.puts repository.queue_count
    when "clear" then repository.queue_clear; out.puts printer.queue_cleared
    when "save"
      file_name = argument.last
      Saver.new.save_file(repository.queue, file_name)
    end
  end

  def print_by
    sort_column = argument.last
    if valid_attribute?(sort_column)
       repository.sort_by(sort_column)
    else
       sort_column = "first_name"
    end
    out.puts repository.queue_print
  end

  def help
    case attribute
    when "load"  then out.puts printer.help_load
    when "find"  then out.puts printer.help_find
    when "queue" then queue_help
    else
      invalid_command
    end
  end

  def queue_help
    case argument.last
    when "count" then out.puts printer.help_queue_count
    when "clear" then out.puts printer.help_queue_clear
    when "print" then out.puts printer.help_queue_print
    when "by"    then out.puts printer.help_queue_print_by
    when "to"    then out.puts printer.help_queue_save_to
    else
      multiple_commands? ? invalid_command : (out.puts printer.help)
    end
  end

  def multiple_commands?
    commands.length > 1
  end

  def invalid_command
    invalid = commands.join(" ")
    quit? ? (out.puts printer.quit) : (out.puts printer.invalid_command(invalid))
  end

  def quit?
    commands.first == 'quit' || commands.first == 'q' || commands.first == 'exit'
  end

end
